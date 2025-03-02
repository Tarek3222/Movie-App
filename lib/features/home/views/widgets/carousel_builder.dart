import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/views/widgets/carousel_item_widget.dart';

class CarouselBuilder extends StatelessWidget {
  const CarouselBuilder({super.key, required this.movies});
  final List<MovieResponse> movies;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) => InkWell(
        onTap: () {
          GoRouter.of(context)
              .push(AppRoutes.movieDetailsView, extra: movies[index]);
        },
        child: CarouselItemWidget(
          movie: movies[index],
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        height: 300.h,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
