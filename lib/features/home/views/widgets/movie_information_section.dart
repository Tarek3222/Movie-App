import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/data/models/movies_genre.dart';
import 'package:movies/features/home/logic/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies/features/home/logic/movie_details_cubit/movie_details_state.dart';

class MovieInformationSection extends StatelessWidget {
  const MovieInformationSection({super.key, required this.movie});
  final MovieResponse movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title ?? 'not found',
            style: AppStyles.font24WhiteBold,
          ).animate().fade().slide(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                movie.releaseDate ?? 'not found',
                style: AppStyles.font14LightGreyMedium,
              ).animate().fade().slide(),
              Text('⭐ ${movie.voteAverage} (IMDb)',
                      style: AppStyles.font14LightGreyMedium)
                  .animate()
                  .fade()
                  .slide(),
              BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                builder: (context, state) {
                  return Text(
                    '${state is MovieDetailsSuccess ? state.movieDetailsResponse.runtime : 'not found'} min',
                    style: AppStyles.font14LightGreyMedium,
                  );
                },
              ).animate().fade().slide(),
            ],
          ),
          verticalSpace(10),
          Wrap(
            spacing: 10.w,
            children: List.generate(
              movie.genreIds!.length,
              (index) => Chip(
                padding: const EdgeInsets.all(4),
                elevation: 0,
                side: const BorderSide(color: AppColors.lighterGrey, width: 1),
                backgroundColor: AppColors.mainDarkBlue,
                label: Text(
                  moviesGenres
                      .firstWhere(
                          (element) => element.id == movie.genreIds![index])
                      .name,
                  style: AppStyles.font14BlueMedium,
                ),
              ),
            ).animate().fade().slide(),
          ),
          verticalSpace(10),
          Text(
            'Description',
            style: AppStyles.font16WhiteSemiBold,
          ).animate().fade().slide(),
          Text(
            movie.overview ?? 'not found',
            style: AppStyles.font14LightGreyMedium,
          ).animate().fade().slide(),
          verticalSpace(10),
        ],
      ),
    );
  }
}
