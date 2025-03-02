import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoadingIndecator extends StatelessWidget {
  const AppLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingFour(
        color: Colors.blue,
        size: 50.0,
      ),
    );
  }
}
