import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/movies_cubit/movie_state.dart';

class MoviesCubit extends Cubit<MovieState> {
  final HomeRepo _homeRepo;
  MoviesCubit(this._homeRepo) : super(const MovieInitial());
  late List<MovieResponse> movies;
  Future<void> emitGetMoviesState() async {
    emit(const ListMoviesLoading());
    var response = await _homeRepo.getListMovies();
    response.fold(
      (failure) {
        emit(ListMoviesError(failure.errorMessage));
      },
      (movies) {
        emit(ListMoviesSuccess(movies));
        this.movies = movies.results!;
      },
    );
  }
}
