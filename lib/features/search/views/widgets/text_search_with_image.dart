import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/core/theme/app_styles.dart';

class TextSearchWithImage extends StatelessWidget {
  const TextSearchWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset('assets/json_files/search.json'),
        verticalSpace(16),
        Text(
          'No Movies found, Search now..',
          style: AppStyles.font16RedSemiBold,
        ),
      ],
    ).animate().fade().slide();
  }
}
