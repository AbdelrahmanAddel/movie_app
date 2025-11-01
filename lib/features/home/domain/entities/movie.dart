import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int? id;
  final String? title;
  final String? overview;

  final double? popularity;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
