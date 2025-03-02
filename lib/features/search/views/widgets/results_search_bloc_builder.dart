import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widget/app_loading_indecator.dart';
import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/search/logic/cubit/search_movies_cubit.dart';
import 'package:movies/features/search/logic/cubit/search_movies_state.dart';
import 'package:movies/features/search/views/widgets/build_results_movies_grid_view.dart';
import 'package:movies/features/search/views/widgets/text_search_with_image.dart';

class ResultsSearchBlocBuilder extends StatelessWidget {
  const ResultsSearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
      builder: (context, state) {
        if (state is SearchMoviesSuccess) {
          List<MovieResponse> movieResponseList =
              state.movieResponseList.results!;
          if (movieResponseList.isEmpty) {
            return const TextSearchWithImage();
          } else {
            return BuildResultsMoviesGridView(
              movieResponseList: movieResponseList,
            );
          }
        } else if (state is SearchMoviesError) {
          return CustomErrorWidget(errorMessage: state.message);
        } else if (state is SearchMoviesLoading) {
          return const AppLoadingIndecator();
        } else {
          return const TextSearchWithImage();
        }
      },
    );
  }
}
