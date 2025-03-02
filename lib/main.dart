import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/core/helper/cache_helper.dart';
import 'package:movies/firebase_options.dart';
import 'package:movies/movie_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setUp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();

  runApp(
    const MovieApp(),
  );
}
