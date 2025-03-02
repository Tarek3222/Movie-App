import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/home/logic/top_rated_cubit/top_rated_movies_cubit.dart';
import 'package:movies/features/home/logic/top_rated_cubit/top_rated_movies_state.dart';
import 'package:movies/features/home/views/widgets/movies_list_view_items.dart';
import 'package:movies/features/home/views/widgets/skeleton_movies_list_view.dart';

class TopRatedMoviesBlocBuilder extends StatefulWidget {
  const TopRatedMoviesBlocBuilder({super.key});

  @override
  State<TopRatedMoviesBlocBuilder> createState() =>
      _TopRatedMoviesBlocBuilderState();
}

class _TopRatedMoviesBlocBuilderState extends State<TopRatedMoviesBlocBuilder> {
  @override
  void initState() {
    context.read<TopRatedMoviesCubit>().emitTopRatedMoviesState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedMoviesSuccess) {
          return MoviesListViewItems(movies: state.movies.results!);
        } else if (state is TopRatedMoviesError) {
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
