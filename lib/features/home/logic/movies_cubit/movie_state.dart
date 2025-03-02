import 'package:movies/features/home/data/models/movie_response.dart';

abstract class MovieState {
  const MovieState();
}

class MovieInitial extends MovieState {
  const MovieInitial();
}

// !List Movies
class ListMoviesLoading extends MovieState {
  const ListMoviesLoading();
}

class ListMoviesSuccess extends MovieState {
  final MovieResponseList movies;
  const ListMoviesSuccess(this.movies);
}

class ListMoviesError extends MovieState {
  final String message;
  const ListMoviesError(this.message);
}
