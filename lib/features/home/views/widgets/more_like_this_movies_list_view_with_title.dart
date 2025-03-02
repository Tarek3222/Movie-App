import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/home/logic/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:movies/features/home/logic/similar_movies_cubit/similar_movies_state.dart';
import 'package:movies/features/home/views/widgets/movies_list_view_items.dart';
import 'package:movies/features/home/views/widgets/skeleton_movies_list_view.dart';

class MoreLikeThisMoviesListViewWithTitle extends StatefulWidget {
  final int movieId;
  const MoreLikeThisMoviesListViewWithTitle({
    super.key,
    required this.movieId,
  });

  @override
  State<MoreLikeThisMoviesListViewWithTitle> createState() =>
      _MoreLikeThisMoviesListViewWithTitleState();
}

class _MoreLikeThisMoviesListViewWithTitleState
    extends State<MoreLikeThisMoviesListViewWithTitle> {
  @override
  void initState() {
    context.read<SimilarMoviesCubit>().getSimilarMovies(
          widget.movieId,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'More Like This',
            style: AppStyles.font16WhiteSemiBold,
          ),
          verticalSpace(10),
          BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
            builder: (context, state) {
              if (state is SimilarMoviesSuccess) {
                return MoviesListViewItems(
                  movies: state.similarMoviesList.results!,
                );
              } else if (state is SimilarMoviesError) {
                return CustomErrorWidget(
                  errorMessage: state.errorMessage,
                );
              } else {
                return const SkeletonMoviesListView();
              }
            },
          ),
          verticalSpace(10),
        ],
      ),
    );
  }
}
