import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/views/widgets/build_expanded_item_movie.dart';

class BuildResultsMoviesGridView extends StatelessWidget {
  const BuildResultsMoviesGridView(
      {super.key, required this.movieResponseList});
  final List<MovieResponse> movieResponseList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieResponseList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.50,
      ),
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.movieDetailsView,
                extra: movieResponseList[index]);
          },
          child: BuildExpandedItemMovie(movie: movieResponseList[index])),
    ).animate().fade().slide();
  }
}
