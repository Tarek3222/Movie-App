import 'package:movies/features/home/data/models/movie_response.dart';

abstract class SimilarMoviesState {
  const SimilarMoviesState();
}

class SimilarMoviesInitial extends SimilarMoviesState {
  const SimilarMoviesInitial();
}

class SimilarMoviesLoading extends SimilarMoviesState {
  const SimilarMoviesLoading();
}

class SimilarMoviesSuccess extends SimilarMoviesState {
  final MovieResponseList similarMoviesList;
  const SimilarMoviesSuccess(this.similarMoviesList);
}

class SimilarMoviesError extends SimilarMoviesState {
  final String errorMessage;
  const SimilarMoviesError(this.errorMessage);
}
