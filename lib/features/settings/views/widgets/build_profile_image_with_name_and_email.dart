import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/firebase/user_model.dart';
import 'package:movies/core/firebase/user_services.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/core/widget/app_loading_indecator.dart';
import 'package:movies/core/widget/custom_error_widget.dart';

class BuildProfileImageWithNameAndEmail extends StatelessWidget {
  const BuildProfileImageWithNameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getIt.get<UserServices>().getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoadingIndecator();
          }
          if (snapshot.hasError) {
            return const CustomErrorWidget(errorMessage: 'Error loading user');
          }
          var userModel = UserModel.fromJson(
              snapshot.data!.data()! as Map<String, dynamic>);
          log(userModel.photoUrl!);
          return InkWell(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRoutes.profileView, extra: userModel);
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 45.r,
                  backgroundImage: userModel.photoUrl == null
                      ? const AssetImage('assets/images/profile_image.png')
                      : CachedNetworkImageProvider(userModel.photoUrl ??
                          'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                ),
                horizontalSpace(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userModel.name,
                        style: AppStyles.font16WhiteSemiBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ).animate().fade().slide(curve: Curves.easeInExpo),
                      verticalSpace(5),
                      Text(
                        userModel.email,
                        style: AppStyles.font14GreyRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ).animate().fade().slide(curve: Curves.easeInExpo),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
