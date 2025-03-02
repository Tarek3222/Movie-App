import 'package:flutter/widgets.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/views/widgets/carousel_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonCarouselBuilder extends StatelessWidget {
  const SkeletonCarouselBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: CarouselBuilder(movies: moviesTestSkeleton),
    );
  }
}

List<MovieResponse> moviesTestSkeleton = List.generate(
  10,
  (index) => MovieResponse(
    id: index,
    title: 'Title $index',
    overview: 'Overview $index',
    posterPath: '${ApiConstants.baseUrlImage}/9nhjGaFLKtddDPtPaX5EmKqsWdH.jpg',
    backdropPath:
        '${ApiConstants.baseUrlImage}/9nhjGaFLKtddDPtPaX5EmKqsWdH.jpg',
    voteAverage: 7.8,
    releaseDate: '',
  ),
);
