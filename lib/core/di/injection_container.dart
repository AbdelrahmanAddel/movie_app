import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_factory.dart';
import 'package:movie_app/core/network/network_info.dart';
import 'package:movie_app/features/home/data/datasources/movie_local_data_source.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/features/home/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/features/home/data/models/hive_model/movie_hive_model.dart';
import 'package:movie_app/features/home/data/repositories_impl/movie_repository_impl.dart';
import 'package:movie_app/features/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/features/home/presentation/cubit/movie_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  final Dio dio = DioClient.getDio();
  final Box<MovieHiveModel> box = await Hive.openBox('movies');
  getIt.registerLazySingleton<MovieLocalDataSource>(
    () => HiveMovieLocalDataSource(box),
  );
  getIt.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImp(dio),
  );
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(  Connectivity()),
  );
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      localDataSource: getIt(),
      remoteDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  getIt.registerLazySingleton<MovieCubit>(() => MovieCubit(getIt(), getIt()));
}
