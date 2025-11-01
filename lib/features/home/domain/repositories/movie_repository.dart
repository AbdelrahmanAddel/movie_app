import 'package:movie_app/features/home/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({int page = 1});
  Future<List<Movie>> getCachedMovies();
}
