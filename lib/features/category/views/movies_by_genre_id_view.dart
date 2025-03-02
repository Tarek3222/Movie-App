import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/widget/app_loading_indecator.dart';
import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/category/logic/cubit/get_movie_by_categories_cubit.dart';
import 'package:movies/features/category/logic/cubit/get_movie_by_categories_state.dart';
import 'package:movies/features/home/data/models/movies_genre.dart';
import 'package:movies/features/home/views/widgets/build_expanded_item_movie.dart';

class MoviesByGenreIdView extends StatefulWidget {
  const MoviesByGenreIdView({super.key, required this.moviesGenre});
  final MoviesGenre moviesGenre;

  @override
  State<MoviesByGenreIdView> createState() => _MoviesByGenreIdViewState();
}

class _MoviesByGenreIdViewState extends State<MoviesByGenreIdView> {
  @override
  void initState() {
    context
        .read<GetMovieByCategoriesCubit>()
        .getMoviesByGenre(genreId: widget.moviesGenre.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          widget.moviesGenre.name,
          style: AppStyles.font24WhiteBold,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: buildMoviesGridView(),
    );
  }

  Widget buildMoviesGridView() {
    return BlocBuilder<GetMovieByCategoriesCubit, GetMovieByCategoriesState>(
      builder: (context, state) {
        if (state is GetMovieByCategoriesSuccess) {
          return GridView.builder(
            itemCount: state.movieResponseList.results!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.53,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRoutes.movieDetailsView,
                    extra: state.movieResponseList.results![index]);
              },
              child: BuildExpandedItemMovie(
                  movie: state.movieResponseList.results![index]),
            ),
          );
        } else if (state is GetMovieByCategoriesError) {
          return CustomErrorWidget(errorMessage: state.message);
        } else {
          return const AppLoadingIndecator();
        }
      },
    );
  }
}
