import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/features/home/data/models/movie_response.dart';
import 'package:movies/features/home/logic/movie_images_cubit/movie_images_cubit.dart';
import 'package:movies/features/home/logic/movie_videos_cubit/movie_videos_cubit.dart';
import 'package:movies/features/home/logic/similar_movies_cubit/similar_movies_cubit.dart';
import 'package:movies/features/home/views/widgets/more_like_this_movies_list_view_with_title.dart';
import 'package:movies/features/home/views/widgets/movie_images_list_view.dart';
import 'package:movies/features/home/views/widgets/movie_information_section.dart';
import 'package:movies/features/home/views/widgets/movie_production_companies.dart';
import 'package:movies/features/home/views/widgets/poster_movie_image_with_player.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movie});
  final MovieResponse movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => getIt.get<MovieVideosCubit>()
                ..emitMovieVideosState(movieId: movie.id!.toString()),
              child: PosterMovieImageWithPlayer(
                movie: movie,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => getIt.get<MovieImagesCubit>(),
              child: MovieImagesListView(
                movieId: movie.id!.toString(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: MovieInformationSection(
              movie: movie,
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => getIt.get<SimilarMoviesCubit>(),
              child: MoreLikeThisMoviesListViewWithTitle(
                movieId: movie.id!,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: MovieproductionCompanies(movieId: movie.id!),
          ),
        ],
      ),
    );
  }
}
