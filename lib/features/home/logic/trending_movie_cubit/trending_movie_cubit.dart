import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/trending_movie_cubit/trending_movie_state.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  final HomeRepo _homeRepo;
  TrendingMovieCubit(this._homeRepo) : super(const TrendingMoviesInitial());
  late List<MovieResponse> movies;
  Future<void> emitTrendingMoviesState() async {
    emit(const TrendingMoviesLoading());
    var response = await _homeRepo.getTrendingMovies();
    response.fold(
      (failure) {
        emit(TrendingMoviesError(failure.errorMessage));
      },
      (movies) {
        emit(TrendingMoviesSuccess(movies));
        this.movies = movies.results!;
      },
    );
  }
}
