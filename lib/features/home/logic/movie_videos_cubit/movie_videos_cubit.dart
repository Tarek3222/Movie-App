import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/movie_video_response.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/movie_videos_cubit/movie_videos_state.dart';

class MovieVideosCubit extends Cubit<MovieVideosState> {
  final HomeRepo _homeRepo;
  MovieVideosCubit(this._homeRepo) : super(const MovieVideosInitial());
  late List<MovieVideoResponse> movieVideos;
  Future<void> emitMovieVideosState({required String movieId}) async {
    emit(const MovieVideosLoading());
    var response = await _homeRepo.getMovieVideos(movieId: movieId);
    response.fold(
      (failure) {
        emit(MovieVideosError(failure.errorMessage));
      },
      (movieVideos) {
        this.movieVideos = movieVideos.results!;
        emit(MovieVideosSuccess(movieVideos));
      },
    );
  }
}
