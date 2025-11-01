import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/network_info.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_state.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository movieRepository;
  final NetworkInfo networkInfo;
  bool _wasOffline = false;
  StreamSubscription<bool>? _subscription;
  MovieCubit(this.movieRepository, this.networkInfo)
    : super(
        MovieState(
          type: MovieStateType.initial,
          movies: [],
          isLoading: false,
          error: null,
          hasMore: true,
        ),
      ) {
    _setupConnectivityListener();
  }

  Future<void> getMovies({bool refresh = false}) async {
    if (state.isLoading || (!state.hasMore && !refresh)) return;
    if (refresh) {
      emit(
        MovieState(
          type: MovieStateType.loading,
          movies: [],
          isLoading: true,
          error: null,
          hasMore: true,
          page: 1,
        ),
      );
    }else{
      emit(
        state.copyWith(isLoading: true),
      );
    }
    try {
      final movies = await movieRepository.getMovies(page: state.page);
      emit(
        MovieState(
          type: MovieStateType.loaded,
          movies: refresh ? movies : [...state.movies, ...movies],
          isLoading: false,
          hasMore: movies.isNotEmpty,
          page: state.page + 1,
        ),
      );
    } on AppException catch (e) {
      List<Movie>? cacheMovies = await _tryToGetCacheMovie();
      if (cacheMovies != null && cacheMovies.isNotEmpty) {
        emit(
          MovieState(
            type: MovieStateType.loaded,
            movies: cacheMovies,
            isLoading: false,
            error: null,
            hasMore: false,
          ),
        );
      } else {
        emit(
          MovieState(
            type: MovieStateType.error,
            movies: [],
            isLoading: false,
            hasMore: false,
            error: e.technicalMessage,
          ),
        );
      }
    } catch (e) {
      emit(
        MovieState(
          type: MovieStateType.error,
          movies: [],
          isLoading: false,
          error: 'Something went wrong',
          hasMore: false,
        ),
      );
    }
  }

  void _setupConnectivityListener() {
    _subscription = networkInfo.isConnectionChanged.listen((isConnected) {
      if (isConnected && _wasOffline) {
        getMovies(refresh: true);
      }
      _wasOffline = !isConnected;
    });
  }

  Future<List<Movie>?> _tryToGetCacheMovie() async {
    try {
      final movies = await movieRepository.getCachedMovies();
      return movies;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
