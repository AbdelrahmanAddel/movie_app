import 'package:hive/hive.dart';

part 'movie_hive_model.g.dart'; 

@HiveType(typeId: 1) 
class MovieHiveModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String overview;

  @HiveField(3)
  final String? posterPath;

  @HiveField(4)
  final double voteAverage;

  @HiveField(5)
  final String releaseDate;

  MovieHiveModel({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory MovieHiveModel.fromJson(Map<String, dynamic> json) {
    return MovieHiveModel(
      id: json['id'] as int,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'], 
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'overview': overview,
        'poster_path': posterPath,
        'vote_average': voteAverage,
        'release_date': releaseDate,
      };
}