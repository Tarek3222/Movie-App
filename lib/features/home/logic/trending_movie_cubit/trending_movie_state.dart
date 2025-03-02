import 'package:movies/features/home/data/models/movie_response.dart';

abstract class TrendingMovieState {
  const TrendingMovieState();
}

// !Trending Movies
class TrendingMoviesInitial extends TrendingMovieState {
  const TrendingMoviesInitial();
}

class TrendingMoviesLoading extends TrendingMovieState {
  const TrendingMoviesLoading();
}

class TrendingMoviesSuccess extends TrendingMovieState {
  final MovieResponseList movies;
  const TrendingMoviesSuccess(this.movies);
}

class TrendingMoviesError extends TrendingMovieState {
  final String message;
  const TrendingMoviesError(this.message);
}
