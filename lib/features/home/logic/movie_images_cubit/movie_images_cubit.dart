import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/movie_images_response.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/movie_images_cubit/movie_images_state.dart';

class MovieImagesCubit extends Cubit<MovieImagesState> {
  final HomeRepo homeRepo;
  MovieImagesCubit(this.homeRepo) : super(const MovieImagesInitial());
  late MovieImagesResponseList movieImagesResponseList;

  Future<void> getMovieImages({required String movieId}) async {
    emit(const MovieImagesLoading());
    var result = await homeRepo.getMovieImages(movieId: movieId);
    result.fold((failure) => emit(MovieImagesError(failure.errorMessage)),
        (movieImages) {
      emit(
        MovieImagesSuccess(movieImages),
      );
      movieImagesResponseList = movieImages;
    });
  }
}
