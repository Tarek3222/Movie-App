import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/home/logic/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:movies/features/home/logic/trending_movie_cubit/trending_movie_state.dart';
import 'package:movies/features/home/views/widgets/movies_list_view_items.dart';
import 'package:movies/features/home/views/widgets/skeleton_movies_list_view.dart';

class TrendingMoviesBlocBuilder extends StatefulWidget {
  const TrendingMoviesBlocBuilder({super.key});

  @override
  State<TrendingMoviesBlocBuilder> createState() =>
      _TrendingMoviesBlocBuilderState();
}

class _TrendingMoviesBlocBuilderState extends State<TrendingMoviesBlocBuilder> {
  @override
  void initState() {
    context.read<TrendingMovieCubit>().emitTrendingMoviesState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
      builder: (context, state) {
        if (state is TrendingMoviesSuccess) {
          return MoviesListViewItems(
              movies: state.movies.results!.reversed.toList());
        } else if (state is TrendingMoviesError) {
          return CustomErrorWidget(
            errorMessage: state.message,
          );
        } else {
          return const SkeletonMoviesListView();
        }
      },
    );
  }
}
