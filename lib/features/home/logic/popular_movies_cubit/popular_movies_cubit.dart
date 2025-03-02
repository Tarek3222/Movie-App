import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/popular_movies_cubit/popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final HomeRepo _homeRepo;
  PopularMoviesCubit(this._homeRepo) : super(const PopularMoviesInitial());
  late List<MovieResponse> movies;
  Future<void> emitPopularMoviesState() async {
    emit(const PopularMoviesLoading());
    var response = await _homeRepo.getPopularMovies();
    response.fold(
      (failure) {
        emit(PopularMoviesError(failure.errorMessage));
      },
      (movies) {
        emit(PopularMoviesSuccess(movies));
        this.movies = movies.results!;
      },
    );
  }
}
