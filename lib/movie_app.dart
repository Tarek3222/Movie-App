import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routing/app_routing.dart';
import 'package:movies/core/theme/app_colors.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        title: 'Movie App',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.mainDarkBlue,
        ),
        routerConfig: AppRouting.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
