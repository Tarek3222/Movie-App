import 'package:movies/features/home/data/models/movie_response.dart';

abstract class SearchMoviesState {
  const SearchMoviesState();
}

class SearchMoviesInitial extends SearchMoviesState {
  const SearchMoviesInitial();
}

class SearchMoviesLoading extends SearchMoviesState {
  const SearchMoviesLoading();
}

class SearchMoviesSuccess extends SearchMoviesState {
  final MovieResponseList movieResponseList;
  const SearchMoviesSuccess(this.movieResponseList);
}

class SearchMoviesError extends SearchMoviesState {
  final String message;
  const SearchMoviesError(this.message);
}
