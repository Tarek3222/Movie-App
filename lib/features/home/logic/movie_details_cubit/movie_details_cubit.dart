import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/movie_details_response.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/movie_details_cubit/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final HomeRepo homeRepo;
  MovieDetailsCubit(this.homeRepo) : super(const MovieDetailsInitial());
  late MovieDetailsResponse movieDetailsResponse;

  Future<void> getMovieDetails({required String movieId}) async {
    emit(const MovieDetailsLoading());
    final result = await homeRepo.getMovieDeatils(movieId: movieId);
    result.fold(
        (failuer) => emit(
              MovieDetailsError(failuer.errorMessage),
            ), (movieDetailsResponse) {
      this.movieDetailsResponse = movieDetailsResponse;
      emit(MovieDetailsSuccess(movieDetailsResponse));
    });
  }
}
