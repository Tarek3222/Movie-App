import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_styles.dart';

class OrSignInWithWidget extends StatelessWidget {
  const OrSignInWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 0.3,
          ),
        ),
        Text(
          ' Or Sign In With ',
          style: AppStyles.font13GreyRegular,
        ),
        const Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 0.3,
          ),
        ),
      ],
    );
  }
}
