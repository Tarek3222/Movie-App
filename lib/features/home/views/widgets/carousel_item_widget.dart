import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/views/widgets/custom_cached_network_image.dart';
import 'package:movies/features/home/views/widgets/info_movie_list.dart';
import 'package:movies/features/home/views/widgets/movie_card_with_add_to_watch_list.dart';

class CarouselItemWidget extends StatelessWidget {
  const CarouselItemWidget({super.key, required this.movie});
  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCachedNetworkImage(
          image: movie.posterPath ?? '',
          height: 210.h,
          width: double.infinity,
        ),
        Positioned(
          bottom: 10.h,
          child: MovieCardWithAddToWatchList(
            movie: movie,
          ),
        ),
        Positioned(
          bottom: 30.h,
          left: 130.w,
          child: InfoMovieList(
            movie: movie,
          ),
        )
      ],
    );
  }
}
