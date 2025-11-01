// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      video: json['video'] as bool?,
      voteCount: (json['voteCount'] as num?)?.toInt(),
      backdropPath: json['backdropPath'] as String?,
      genreIds: (json['genreIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      adult: json['adult'] as bool?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate,
      'popularity': instance.popularity,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'video': instance.video,
      'voteCount': instance.voteCount,
      'backdropPath': instance.backdropPath,
      'genreIds': instance.genreIds,
      'adult': instance.adult,
    };
