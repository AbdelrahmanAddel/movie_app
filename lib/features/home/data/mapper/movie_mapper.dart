import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/domain/entities/movie.dart';

class MovieMapper {
  static Movie toMovie(MovieModel movieResponse) {
    return Movie(
      id: movieResponse.id,
      title: movieResponse.title,
      overview: movieResponse.overview,
      releaseDate: movieResponse.releaseDate,
      popularity: movieResponse.popularity,
      posterPath: movieResponse.posterPath,
    );
  }
}
