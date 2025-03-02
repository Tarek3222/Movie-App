import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/home/data/models/movie_response.dart';

class InfoMovieList extends StatelessWidget {
  const InfoMovieList({super.key, required this.movie});
  final MovieResponse movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title ?? 'not found',
          style: AppStyles.font16WhiteSemiBold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ).animate().fade().slide(curve: Curves.easeIn),
        // rating
        Text(
          'vote_average: ${movie.voteAverage}',
          style: AppStyles.font14BlueMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ).animate().fade().slide(),
      ],
    );
  }
}
