import 'package:movies/features/home/data/models/movie_video_response.dart';

abstract class MovieVideosState {
  const MovieVideosState();
}

// !Movie Videos

class MovieVideosInitial extends MovieVideosState {
  const MovieVideosInitial();
}

class MovieVideosLoading extends MovieVideosState {
  const MovieVideosLoading();
}

class MovieVideosSuccess extends MovieVideosState {
  final MovieVideoResponseList movieVideos;
  const MovieVideosSuccess(this.movieVideos);
}

class MovieVideosError extends MovieVideosState {
  final String message;
  const MovieVideosError(this.message);
}
