import 'package:hive/hive.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/features/home/data/models/hive_model/movie_hive_model.dart';

abstract class MovieLocalDataSource {
  Future<void> cacheMovies(List<MovieHiveModel> movies);
  Future<List<MovieHiveModel>> getCachedMovies();
}

class HiveMovieLocalDataSource implements MovieLocalDataSource {
  final Box<MovieHiveModel> _box;
  HiveMovieLocalDataSource(this._box);
  @override
  Future<void> cacheMovies(List<MovieHiveModel> movies) async {
    try {
      await _box.clear();
      await _box.addAll(movies);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<List<MovieHiveModel>> getCachedMovies() async {
    try {
      if (_box.isEmpty) return [];
      return _box.values.toList();
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
