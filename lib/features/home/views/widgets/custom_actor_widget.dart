import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/home/data/models/actor_response.dart';

class CustomActorWidget extends StatelessWidget {
  const CustomActorWidget({super.key, required this.actor});
  final ActorResponse actor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.actorDetailsView, extra: actor);
      },
      child: Column(
        children: [
          Hero(
            tag: actor.id!,
            child: CircleAvatar(
              radius: 40.r,
              backgroundImage: CachedNetworkImageProvider(
                '${ApiConstants.baseUrlImage}${actor.profilePath}',
              ),
            ),
          ),
          Text(
            actor.name ?? 'not found',
            style: AppStyles.font16WhiteRegular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).animate().fade().slide(curve: Curves.easeInExpo),
          Text(
            actor.knownForDepartment ?? 'not found',
            style: AppStyles.font14GreyRegular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).animate().fade().slide(),
        ],
      ),
    );
  }
}
