// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorListResponse _$ActorListResponseFromJson(Map<String, dynamic> json) =>
    ActorListResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ActorResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActorListResponseToJson(ActorListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ActorResponse _$ActorResponseFromJson(Map<String, dynamic> json) =>
    ActorResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      mediaType: json['media_type'] as String?,
      adult: json['adult'] as bool?,
      popularity: json['popularity'] as num?,
      gender: (json['gender'] as num?)?.toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      profilePath: json['profile_path'] as String?,
      knownFor: (json['known_for'] as List<dynamic>?)
          ?.map((e) => MovieResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActorResponseToJson(ActorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'media_type': instance.mediaType,
      'adult': instance.adult,
      'popularity': instance.popularity,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'profile_path': instance.profilePath,
      'known_for': instance.knownFor,
    };
