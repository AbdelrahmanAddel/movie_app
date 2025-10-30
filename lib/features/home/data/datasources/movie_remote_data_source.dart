import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:retrofit/retrofit.dart';
part 'movie_remote_data_source.g.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieResponse>> getPopularMovies();
}


@RestApi(baseUrl: 'https://api.themoviedb.org/3/movie')
abstract class RestClient implements MovieRemoteDataSource {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @override
  @GET('/popular')
  Future<List<MovieResponse>> getPopularMovies();
}

