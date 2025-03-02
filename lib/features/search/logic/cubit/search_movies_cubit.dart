import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/search/data/repos/search_repo.dart';
import 'package:movies/features/search/logic/cubit/search_movies_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final SearchRepo _searchRepo;
  SearchMoviesCubit(this._searchRepo) : super(const SearchMoviesInitial());
  late MovieResponseList movieResponseList;
  Future<void> searchMovies({required String query}) async {
    emit(const SearchMoviesLoading());
    final result = await _searchRepo.searchMovies(query: query);
    result.fold(
        (failure) => emit(
              SearchMoviesError(
                failure.errorMessage,
              ),
            ), (movieResponseList) {
      this.movieResponseList = movieResponseList;
      emit(
        SearchMoviesSuccess(movieResponseList),
      );
    });
  }
}
