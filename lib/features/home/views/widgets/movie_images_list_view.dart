import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/home/data/models/movie_images_response.dart';
import 'package:movies/features/home/logic/movie_images_cubit/movie_images_cubit.dart';
import 'package:movies/features/home/logic/movie_images_cubit/movie_images_state.dart';
import 'package:movies/features/home/views/widgets/custom_cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieImagesListView extends StatefulWidget {
  final String movieId;
  const MovieImagesListView({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieImagesListView> createState() => _MovieImagesListViewState();
}

class _MovieImagesListViewState extends State<MovieImagesListView> {
  @override
  void initState() {
    context.read<MovieImagesCubit>().getMovieImages(
          movieId: widget.movieId,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieImagesCubit, MovieImagesState>(
      builder: (context, state) {
        if (state is MovieImagesSuccess) {
          return BuildMovieImagesListView(
            movieImages: state.movieImagesResponseList,
          );
        } else if (state is MovieImagesError) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return Skeletonizer(
            child: BuildMovieImagesListView(
              movieImages: movieImagesTestSkeleton,
            ),
          );
        }
      },
    );
  }
}

class BuildMovieImagesListView extends StatelessWidget {
  final MovieImagesResponseList movieImages;
  const BuildMovieImagesListView({
    super.key,
    required this.movieImages,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        scrollDirection: Axis.horizontal,
        itemCount: movieImages.backdrops.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 8.w, left: index == 0 ? 10.w : 0),
          child: InstaImageViewer(
            child: CustomCachedNetworkImage(
              image:
                  '${ApiConstants.baseUrlImage}${movieImages.backdrops[index].filePath}',
              height: 100.h,
              width: 100.w,
            ),
          ),
        ),
      ),
    );
  }
}

MovieImagesResponseList movieImagesTestSkeleton = MovieImagesResponseList(
  backdrops: List.generate(
    10,
    (index) => const MovieImagesResponse(
      aspectRatio: 1.0,
      filePath: '${ApiConstants.baseUrlImage}/c4sKOIJNubiSZnv58s7W3Bdmwb.jpg',
    ),
  ),
);
