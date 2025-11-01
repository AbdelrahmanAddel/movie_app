import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/handle_errors.dart';
import 'package:movie_app/core/network/network_info.dart';
import 'package:movie_app/features/home/data/mapper/movie_mapper.dart';
import 'package:movie_app/features/home/data/models/hive_model/movie_hive_model.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';
import 'package:movie_app/features/home/data/datasources/movie_local_data_source.dart';
import 'package:movie_app/features/home/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final NetworkInfo networkInfo;
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;
  MovieRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<List<Movie>> getMovies({int page = 1}) async {
    try {
      if (await networkInfo.isConnected) {
        final remoteMovies = await remoteDataSource.getMovies(
          '29184053a6041722076105d03b52dbef',
          page,
        );
        if (page == 1) {
          await localDataSource.cacheMovies(
            remoteMovies.results
                .map((movie) => MovieHiveModel.fromJson(movie.toJson()))
                .toList(),
          );
        }
        return remoteMovies.results
            .map((movie) => MovieMapper.toMovie(movie))
            .toList();
      } else {
        return getCachedMovies();
      }
    } catch (e) {
      if (e is DioException) {
        throw HandleError.handleDioException(e);
      } else {
        throw UnknownException(
          message: 'Something went wrong',
          technicalMessage: 'Something went wrong',
        );
      }
    }
  }

  @override
  Future<List<Movie>> getCachedMovies() async {
    try {
      final localMovies = await localDataSource.getCachedMovies();
      return localMovies
          .map((movie) => Movie.fromJson(movie.toJson()))
          .toList();
    } catch (e) {
      if (e is DioException) {
        throw HandleError.handleDioException(e);
      } else {
        throw UnknownException(
          message: 'Something went wrong',
          technicalMessage: 'Something went wrong',
        );
      }
    }
  }
}
