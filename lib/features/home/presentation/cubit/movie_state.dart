import 'package:movie_app/features/home/domain/entities/movie.dart';
enum MovieStateType {
  initial,
  loading,
  loaded, 
  error,
}
class MovieState {
  final MovieStateType type;
  final List<Movie> movies;
  final bool isLoading;
  final String? error;
  final bool hasMore;
  final int page;

  MovieState({
    required this.type,
    required this.movies,
    required this.isLoading,
    this.error,
    this.hasMore = true,
    this.page = 1,
    });

  MovieState copyWith({
    MovieStateType? type,
    List<Movie>? movies,
    bool? isLoading,
    String? error,
    bool? hasMore,
    int? page,
  }) {
    return MovieState(
      type: type ?? this.type,
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
    );
  }
}
