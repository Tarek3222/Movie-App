import 'package:flutter/widgets.dart';
import 'package:movies/features/home/views/widgets/movies_list_view_items.dart';
import 'package:movies/features/home/views/widgets/skeleton_carousel_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonMoviesListView extends StatelessWidget {
  const SkeletonMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: MoviesListViewItems(movies: moviesTestSkeleton),
    );
  }
}
