import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/top_rated_cubit/top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final HomeRepo _homeRepo;
  TopRatedMoviesCubit(this._homeRepo) : super(const TopRatedMoviesInitial());
  late List<MovieResponse> movies;
  Future<void> emitTopRatedMoviesState() async {
    emit(const TopRatedMoviesLoading());
    var response = await _homeRepo.getTopRatedMovies();
    response.fold(
      (failure) {
        emit(TopRatedMoviesError(failure.errorMessage));
      },
      (movies) {
        emit(TopRatedMoviesSuccess(movies));
        this.movies = movies.results!;
      },
    );
  }
}
