import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/home/logic/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies/features/home/logic/popular_movies_cubit/popular_movies_state.dart';
import 'package:movies/features/home/views/widgets/movies_list_view_items.dart';
import 'package:movies/features/home/views/widgets/skeleton_movies_list_view.dart';

class PopularMoviesListView extends StatefulWidget {
  const PopularMoviesListView({super.key});

  @override
  State<PopularMoviesListView> createState() => _PopularMoviesListViewState();
}

class _PopularMoviesListViewState extends State<PopularMoviesListView> {
  @override
  void initState() {
    context.read<PopularMoviesCubit>().emitPopularMoviesState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesSuccess) {
          return MoviesListViewItems(movies: state.movies.results!);
        } else if (state is PopularMoviesError) {
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
