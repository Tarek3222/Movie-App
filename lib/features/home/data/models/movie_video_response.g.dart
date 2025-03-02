// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideoResponseList _$MovieVideoResponseListFromJson(
        Map<String, dynamic> json) =>
    MovieVideoResponseList(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVideoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieVideoResponseListToJson(
        MovieVideoResponseList instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MovieVideoResponse _$MovieVideoResponseFromJson(Map<String, dynamic> json) =>
    MovieVideoResponse(
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      type: json['type'] as String?,
      official: json['official'] as bool?,
      id: json['id'] as String?,
      iso6391: json['iso_639_1'] as String?,
      iso31661: json['iso_3166_1'] as String?,
      publishedAt: json['published_at'] as String?,
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieVideoResponseToJson(MovieVideoResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'type': instance.type,
      'official': instance.official,
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'published_at': instance.publishedAt,
      'size': instance.size,
    };
