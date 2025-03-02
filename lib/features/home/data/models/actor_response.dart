import 'package:json_annotation/json_annotation.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
part 'actor_response.g.dart';

@JsonSerializable()
class ActorListResponse {
  final List<ActorResponse>? results;

  ActorListResponse({this.results});

  factory ActorListResponse.fromJson(Map<String, dynamic> json) =>
      _$ActorListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActorListResponseToJson(this);
}

@JsonSerializable()
class ActorResponse {
  final int? id;
  final String? name;
  @JsonKey(name: 'original_name')
  final String? originalName;
  @JsonKey(name: 'media_type')
  final String? mediaType;
  final bool? adult;
  final num? popularity;
  final int? gender;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'known_for')
  final List<MovieResponse>? knownFor;

  ActorResponse(
      {this.id,
      this.name,
      this.originalName,
      this.mediaType,
      this.adult,
      this.popularity,
      this.gender,
      this.knownForDepartment,
      this.profilePath,
      this.knownFor});

  factory ActorResponse.fromJson(Map<String, dynamic> json) =>
      _$ActorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActorResponseToJson(this);
}
