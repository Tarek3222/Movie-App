// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieImagesResponseList _$MovieImagesResponseListFromJson(
        Map<String, dynamic> json) =>
    MovieImagesResponseList(
      backdrops: (json['backdrops'] as List<dynamic>)
          .map((e) => MovieImagesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieImagesResponseListToJson(
        MovieImagesResponseList instance) =>
    <String, dynamic>{
      'backdrops': instance.backdrops,
    };

MovieImagesResponse _$MovieImagesResponseFromJson(Map<String, dynamic> json) =>
    MovieImagesResponse(
      filePath: json['file_path'] as String?,
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieImagesResponseToJson(
        MovieImagesResponse instance) =>
    <String, dynamic>{
      'file_path': instance.filePath,
      'aspect_ratio': instance.aspectRatio,
    };
