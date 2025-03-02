import 'package:json_annotation/json_annotation.dart';
part 'movie_video_response.g.dart';

@JsonSerializable()
class MovieVideoResponseList {
  final List<MovieVideoResponse>? results;

  MovieVideoResponseList({this.results});

  factory MovieVideoResponseList.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoResponseListToJson(this);
}

@JsonSerializable()
class MovieVideoResponse {
  final String? name;
  final String? key;
  final String? site;
  final String? type;
  final bool? official;
  final String? id;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final int? size;

  MovieVideoResponse({
    this.name,
    this.key,
    this.site,
    this.type,
    this.official,
    this.id,
    this.iso6391,
    this.iso31661,
    this.publishedAt,
    this.size,
  });

  factory MovieVideoResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideoResponseToJson(this);
}
