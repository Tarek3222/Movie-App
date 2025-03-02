import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/home/logic/movies_cubit/movie_cubit.dart';
import 'package:movies/features/home/logic/movies_cubit/movie_state.dart';
import 'package:movies/features/home/views/widgets/carousel_builder.dart';
import 'package:movies/features/home/views/widgets/skeleton_carousel_builder.dart';

class ListMoviesCarouselBlocBuilder extends StatefulWidget {
  const ListMoviesCarouselBlocBuilder({super.key});

  @override
  State<ListMoviesCarouselBlocBuilder> createState() =>
      _ListMoviesCarouselBlocBuilderState();
}

class _ListMoviesCarouselBlocBuilderState
    extends State<ListMoviesCarouselBlocBuilder> {
  @override
  void initState() {
    context.read<MoviesCubit>().emitGetMoviesState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MovieState>(
      builder: (context, state) {
        if (state is ListMoviesSuccess) {
          return CarouselBuilder(movies: state.movies.results!);
        } else if (state is ListMoviesError) {
          return CustomErrorWidget(
            errorMessage: state.message,
          );
        } else {
          return const SkeletonCarouselBuilder();
        }
      },
    );
  }
}
