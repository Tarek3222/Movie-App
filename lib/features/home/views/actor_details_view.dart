import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/home/data/models/actor_response.dart';
import 'package:movies/features/home/views/widgets/movies_list_view_items.dart';

class ActorDetailsView extends StatelessWidget {
  const ActorDetailsView({super.key, required this.actor});
  final ActorResponse actor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  actorDetails(
                      title: "Department: ", value: actor.knownForDepartment!),
                  actorDetails(
                      title: "Popularity: ",
                      value: actor.popularity!.toString()),
                  actorDetails(
                      title: "Gender: ",
                      value: actor.gender! == 1 ? "Female" : "male"),
                  verticalSpace(20),
                  Text(
                    'Known For',
                    style: AppStyles.font24BlueBold,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: MoviesListViewItems(movies: actor.knownFor!),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(500),
          ),
        ],
      ),
    );
  }

  Widget actorDetails({required String title, required String value}) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppStyles.font24BlueBold,
          ),
          TextSpan(
            text: value,
            style: AppStyles.font16WhiteSemiBold,
          ),
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBar(context) {
    return SliverAppBar(
      expandedHeight: 400.h,
      pinned: true,
      stretch: true,
      leading: const BackButton(
        color: Colors.white,
      ),
      backgroundColor: AppColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          actor.name!,
          style: AppStyles.font16WhiteSemiBold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        background: Hero(
          tag: actor.id!,
          child: Image(
            image: CachedNetworkImageProvider(
              '${ApiConstants.baseUrlImage}${actor.profilePath}',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
