import 'package:movies/features/home/data/models/movie_response.dart';

abstract class TopRatedMoviesState {
  const TopRatedMoviesState();
}

// !Top Rated Movies
class TopRatedMoviesInitial extends TopRatedMoviesState {
  const TopRatedMoviesInitial();
}

class TopRatedMoviesLoading extends TopRatedMoviesState {
  const TopRatedMoviesLoading();
}

class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final MovieResponseList movies;
  const TopRatedMoviesSuccess(this.movies);
}

class TopRatedMoviesError extends TopRatedMoviesState {
  final String message;
  const TopRatedMoviesError(this.message);
}
