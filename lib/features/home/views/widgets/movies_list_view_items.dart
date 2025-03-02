import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/views/widgets/movie_card_with_add_to_watch_list.dart';

class MoviesListViewItems extends StatelessWidget {
  const MoviesListViewItems({super.key, required this.movies});
  final List<MovieResponse> movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                top: 5.h, right: 8.w, left: index == 0 ? 10.w : 0),
            child: InkWell(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRoutes.movieDetailsView, extra: movies[index]);
              },
              child: MovieCardWithAddToWatchList(
                movie: movies[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
