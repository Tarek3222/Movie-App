import 'package:json_annotation/json_annotation.dart';
part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponseList {
  final List<MovieResponse>? results;

  MovieResponseList({this.results});

  factory MovieResponseList.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseListToJson(this);
}

@JsonSerializable()
class MovieResponse {
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final String? title;
  final bool? video;
  @JsonKey(name: 'vote_average')
  final num? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  MovieResponse({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
