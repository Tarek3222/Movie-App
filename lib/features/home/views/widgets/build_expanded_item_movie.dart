import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/views/widgets/movie_card_with_add_to_watch_list.dart';

class BuildExpandedItemMovie extends StatelessWidget {
  const BuildExpandedItemMovie({super.key, required this.movie});
  final MovieResponse movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieCardWithAddToWatchList(
            movie: movie,
          ),
          Text(
            movie.title ?? 'not found',
            style: AppStyles.font16WhiteSemiBold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '⭐ ${movie.voteAverage}',
            style: AppStyles.font14BlueMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
