import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/logic/movie_videos_cubit/movie_videos_cubit.dart';
import 'package:movies/features/home/logic/movie_videos_cubit/movie_videos_state.dart';
import 'package:movies/features/home/views/widgets/custom_cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class PosterMovieImageWithPlayer extends StatelessWidget {
  const PosterMovieImageWithPlayer({super.key, required this.movie});
  final MovieResponse movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCachedNetworkImage(
          image: '${ApiConstants.baseUrlImage}${movie.posterPath}',
          height: 400.h,
          width: double.infinity,
        ),
        Positioned(
          top: 50.h,
          left: 20.w,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: BlocBuilder<MovieVideosCubit, MovieVideosState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.red,
                    size: 50,
                  ),
                  onPressed: () {
                    launchURL(
                        key: context
                            .read<MovieVideosCubit>()
                            .movieVideos
                            .first
                            .key!);
                  },
                );
              },
            )),
        Positioned(
          top: 50.h,
          right: 20.w,
          child: IconButton(
            icon: const Icon(
              Icons.bookmark_add_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Future<void> launchURL({required String key}) async {
    String url = 'https://www.youtube.com/watch?v=$key';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
