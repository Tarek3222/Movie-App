import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/views/widgets/add_to_watch_list.dart';
import 'package:movies/features/home/views/widgets/custom_cached_network_image.dart';

class MovieCardWithAddToWatchList extends StatelessWidget {
  const MovieCardWithAddToWatchList({super.key, required this.movie});
  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCachedNetworkImage(
          image: movie.backdropPath ?? '',
          height: 170.h,
          width: 120.w,
        ),
        const AddToWatchList(),
      ],
    );
  }
}
