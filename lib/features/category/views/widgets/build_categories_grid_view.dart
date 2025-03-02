import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/home/data/models/movies_genre.dart';

class BuildCategoriesGridView extends StatelessWidget {
  const BuildCategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: moviesGenres.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 15.h,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          GoRouter.of(context)
              .push(AppRoutes.moviesByGenreIdView, extra: moviesGenres[index]);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: AssetImage(moviesGenres[index].image),
              opacity: 0.4,
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            moviesGenres[index].name,
            style: AppStyles.font16WhiteSemiBold,
          ).animate().fade().slide(curve: Curves.easeInExpo),
        ),
      ),
    );
  }
}
