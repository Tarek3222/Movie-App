import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/firebase/user_model.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/settings/views/widgets/item_profile_with_information_with_divider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Profile',
          style: AppStyles.font24WhiteBold,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            verticalSpace(30),
            CircleAvatar(
              radius: 70.r,
              backgroundImage: user.photoUrl == null
                  ? const AssetImage('assets/images/profile_image.png')
                  : CachedNetworkImageProvider(user.photoUrl ??
                      'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
            ),
            verticalSpace(50),
            ItemProfileWithInformationWithDivider(
              title: "USERNAME",
              value: user.name,
            ),
            ItemProfileWithInformationWithDivider(
              title: "EMAIL",
              value: user.email,
            ),
            ItemProfileWithInformationWithDivider(
              title: "PHONE NUMBER",
              value: user.phoneNumber,
            ),
            const ItemProfileWithInformationWithDivider(
              title: "GENDER",
              value: "MALE",
            ),
          ],
        ),
      ),
    );
  }
}
