import 'package:movies/features/home/data/models/movie_response.dart';

abstract class GetMovieByCategoriesState {
  const GetMovieByCategoriesState();
}

class GetMovieByCategoriesInitial extends GetMovieByCategoriesState {
  const GetMovieByCategoriesInitial();
}

class GetMovieByCategoriesLoading extends GetMovieByCategoriesState {
  const GetMovieByCategoriesLoading();
}

class GetMovieByCategoriesSuccess extends GetMovieByCategoriesState {
  final MovieResponseList movieResponseList;
  const GetMovieByCategoriesSuccess(this.movieResponseList);
}

class GetMovieByCategoriesError extends GetMovieByCategoriesState {
  final String message;
  const GetMovieByCategoriesError(this.message);
}
