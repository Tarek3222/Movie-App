import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/similar_movies_cubit/similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  final HomeRepo homeRepo;
  SimilarMoviesCubit(this.homeRepo) : super(const SimilarMoviesInitial());

  Future<void> getSimilarMovies(int movieId) async {
    emit(const SimilarMoviesLoading());
    var result = await homeRepo.getSimilarMovies(movieId: movieId.toString());
    result.fold(
      (failure) => emit(
        SimilarMoviesError(failure.errorMessage),
      ),
      (movieResponseList) => emit(
        SimilarMoviesSuccess(movieResponseList),
      ),
    );
  }
}
