import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';

class AddToWatchList extends StatelessWidget {
  const AddToWatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.bookmark_add_outlined,
      color: AppColors.mainRed,
    );
  }
}
