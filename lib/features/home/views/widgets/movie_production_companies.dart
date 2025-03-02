import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/home/data/models/movie_details_response.dart';
import 'package:movies/features/home/logic/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies/features/home/logic/movie_details_cubit/movie_details_state.dart';
import 'package:movies/features/home/views/widgets/skeleton_actors_list_view.dart';

class MovieproductionCompanies extends StatefulWidget {
  final int movieId;
  const MovieproductionCompanies({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieproductionCompanies> createState() =>
      _MovieproductionCompaniesState();
}

class _MovieproductionCompaniesState extends State<MovieproductionCompanies> {
  @override
  void initState() {
    context
        .read<MovieDetailsCubit>()
        .getMovieDetails(movieId: widget.movieId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsSuccess) {
          return BuildProductionCompaniesListViewWtihTitleText(
            productionCompanies: state.movieDetailsResponse.productionCompanies,
          );
        } else if (state is MovieDetailsError) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return const SkeletonActorsListView();
        }
      },
    );
  }
}

class BuildProductionCompaniesListViewWtihTitleText extends StatelessWidget {
  final List<ProductionCompanies>? productionCompanies;
  const BuildProductionCompaniesListViewWtihTitleText({
    super.key,
    this.productionCompanies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: AppColors.lighterGrey,
            thickness: 0.15,
          ),
          verticalSpace(10),
          Text(
            'Production Companies',
            style: AppStyles.font16WhiteSemiBold,
          ),
          verticalSpace(10),
          SizedBox(
            height: 110.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productionCompanies?.length ?? 0,
              itemBuilder: (context, index) => Padding(
                padding:
                    EdgeInsets.only(right: 8.w, left: index == 0 ? 10.w : 0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage:
                          productionCompanies?[index].logoPath == null
                              ? const NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                )
                              : CachedNetworkImageProvider(
                                  '${ApiConstants.baseUrlImage}${productionCompanies?[index].logoPath}',
                                ),
                    ),
                    Text(
                      productionCompanies?[index].name ?? 'not found',
                      style: AppStyles.font16WhiteRegular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ).animate().fade().slide(),
                  ],
                ),
              ),
            ),
          ),
          verticalSpace(10),
        ],
      ),
    );
  }
}
