import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/features/home/logic/actors_cubit/actors_cubit.dart';
import 'package:movies/features/home/logic/movies_cubit/movie_cubit.dart';
import 'package:movies/features/home/logic/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies/features/home/logic/top_rated_cubit/top_rated_movies_cubit.dart';
import 'package:movies/features/home/logic/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:movies/features/home/views/widgets/actors_bloc_builder.dart';
import 'package:movies/features/home/views/widgets/list_movies_carousel_bloc_builder.dart.dart';
import 'package:movies/features/home/views/widgets/popular_movies_list_view.dart';
import 'package:movies/features/home/views/widgets/title_category_movies_and_view_all_text.dart';
import 'package:movies/features/home/views/widgets/top_rated_movies_bloc_builder.dart';
import 'package:movies/features/home/views/widgets/trending_movies_bloc_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) => getIt.get<MoviesCubit>(),
                child: const ListMoviesCarouselBlocBuilder(),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) => getIt.get<TrendingMovieCubit>(),
                child: Builder(builder: (context) {
                  return Column(
                    children: [
                      TitleCategoryMoviesAndViewAllText(
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRoutes.moviesExpandedView,
                            extra: {
                              'title': 'Trending',
                              'movies':
                                  context.read<TrendingMovieCubit>().movies,
                            },
                          );
                        },
                        title: 'Trending',
                      ),
                      const TrendingMoviesBlocBuilder(),
                    ],
                  );
                }),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) => getIt.get<ActorsCubit>(),
                child: Builder(builder: (context) {
                  return Column(
                    children: [
                      TitleCategoryMoviesAndViewAllText(
                        title: 'Actors List',
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRoutes.actorsExpandedView,
                            extra: {
                              'title': 'Actors',
                              'actors': context.read<ActorsCubit>().actors,
                            },
                          );
                        },
                      ),
                      const ActorsBlocBuilder(),
                    ],
                  );
                }),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) => getIt.get<TopRatedMoviesCubit>(),
                child: Builder(builder: (context) {
                  return Column(
                    children: [
                      TitleCategoryMoviesAndViewAllText(
                          title: 'Top Rated',
                          onTap: () {
                            GoRouter.of(context).push(
                              AppRoutes.moviesExpandedView,
                              extra: {
                                'title': 'TopRated',
                                'movies':
                                    context.read<TopRatedMoviesCubit>().movies,
                              },
                            );
                          }),
                      const TopRatedMoviesBlocBuilder(),
                    ],
                  );
                }),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) => getIt.get<PopularMoviesCubit>(),
                child: Builder(builder: (context) {
                  return Column(
                    children: [
                      TitleCategoryMoviesAndViewAllText(
                        title: 'Popular',
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRoutes.moviesExpandedView,
                            extra: {
                              'title': 'Popular',
                              'movies':
                                  context.read<PopularMoviesCubit>().movies,
                            },
                          );
                        },
                      ),
                      const PopularMoviesListView(),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
