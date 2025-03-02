import 'package:movies/features/home/data/models/movie_images_response.dart';

abstract class MovieImagesState {
  const MovieImagesState();
}

class MovieImagesInitial extends MovieImagesState {
  const MovieImagesInitial();
}

class MovieImagesLoading extends MovieImagesState {
  const MovieImagesLoading();
}

class MovieImagesSuccess extends MovieImagesState {
  final MovieImagesResponseList movieImagesResponseList;
  const MovieImagesSuccess(this.movieImagesResponseList);
}

class MovieImagesError extends MovieImagesState {
  final String errorMessage;
  const MovieImagesError(this.errorMessage);
}
