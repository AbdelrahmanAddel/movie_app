import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:retrofit/retrofit.dart';
part 'movie_remote_data_source.g.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse> getMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );
}

@RestApi(baseUrl: 'https://api.themoviedb.org/3/movie')
abstract class MovieRemoteDataSourceImp implements MovieRemoteDataSource {
  factory MovieRemoteDataSourceImp(Dio dio) = _MovieRemoteDataSourceImp;

  @override
  @GET('/popular')
  Future<MovieResponse> getMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  ) ;
}
