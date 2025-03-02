import 'package:json_annotation/json_annotation.dart';
part 'movie_images_response.g.dart';

@JsonSerializable()
class MovieImagesResponseList {
  final List<MovieImagesResponse> backdrops;

  const MovieImagesResponseList({required this.backdrops});

  factory MovieImagesResponseList.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImagesResponseListToJson(this);
}

@JsonSerializable()
class MovieImagesResponse {
  @JsonKey(name: 'file_path')
  final String? filePath;
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;

  const MovieImagesResponse({this.filePath, this.aspectRatio});

  factory MovieImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImagesResponseToJson(this);
}
