import 'package:movies/features/home/data/models/movie_details_response.dart';

abstract class MovieDetailsState {
  const MovieDetailsState();
}

class MovieDetailsInitial extends MovieDetailsState {
  const MovieDetailsInitial();
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsResponse movieDetailsResponse;
  const MovieDetailsSuccess(this.movieDetailsResponse);
}

class MovieDetailsError extends MovieDetailsState {
  final String errorMessage;
  const MovieDetailsError(this.errorMessage);
}
