import 'package:movies/features/home/data/models/movie_response.dart';

abstract class PopularMoviesState {
  const PopularMoviesState();
}

// !Popular Movies
class PopularMoviesInitial extends PopularMoviesState {
  const PopularMoviesInitial();
}

class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

class PopularMoviesSuccess extends PopularMoviesState {
  final MovieResponseList movies;
  const PopularMoviesSuccess(this.movies);
}

class PopularMoviesError extends PopularMoviesState {
  final String message;
  const PopularMoviesError(this.message);
}
