import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieResponse {
  final int page;
  final List<MovieModel> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class MovieModel {
  final int? id;
  final String? title;
  final String? overview;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final double? popularity;
  final String? originalLanguage;
  final String? originalTitle;
  final bool? video;
  final int? voteCount;
  final String? backdropPath;
  final List<int>? genreIds;
  final bool? adult;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.popularity,
    required this.originalLanguage,
    required this.originalTitle,
    required this.video,
    required this.voteCount,
    required this.backdropPath,
    required this.genreIds,
    required this.adult,
  });

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
