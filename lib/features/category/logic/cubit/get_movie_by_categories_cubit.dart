import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/category/data/repos/categories_repo.dart';
import 'package:movies/features/category/logic/cubit/get_movie_by_categories_state.dart';
import 'package:movies/features/home/data/models/movie_response.dart';

class GetMovieByCategoriesCubit extends Cubit<GetMovieByCategoriesState> {
  final CategoriesRepo _categoriesRepo;
  GetMovieByCategoriesCubit(this._categoriesRepo)
      : super(const GetMovieByCategoriesInitial());
  late MovieResponseList movieResponseList;
  Future<void> getMoviesByGenre({required int genreId}) async {
    emit(const GetMovieByCategoriesLoading());
    final result = await _categoriesRepo.getMoviesByGenre(genreId: genreId);
    result.fold(
        (failure) => emit(
              GetMovieByCategoriesError(failure.errorMessage),
            ), (movieResponseList) {
      this.movieResponseList = movieResponseList;
      emit(
        GetMovieByCategoriesSuccess(
          movieResponseList,
        ),
      );
    });
  }
}
