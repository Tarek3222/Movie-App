import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/views/widgets/build_expanded_item_movie.dart';

class MoviesExpandedView extends StatelessWidget {
  const MoviesExpandedView(
      {super.key, required this.title, required this.movies});
  final String title;
  final List<MovieResponse> movies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          title,
          style: AppStyles.font24WhiteBold,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: buildMoviesGridView(),
    );
  }

  GridView buildMoviesGridView() {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.53,
      ),
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            GoRouter.of(context)
                .push(AppRoutes.movieDetailsView, extra: movies[index]);
          },
          child: BuildExpandedItemMovie(movie: movies[index])),
    );
  }
}
