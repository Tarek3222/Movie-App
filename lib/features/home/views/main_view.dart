// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/di/dependancy_injection.dart';
import 'package:movies/features/category/views/categories_tab.dart';
import 'package:movies/features/home/views/home_view.dart';
import 'package:movies/features/home/views/widgets/custom_curved_bottom_nav_bar.dart';
import 'package:movies/features/search/logic/cubit/search_movies_cubit.dart';
import 'package:movies/features/search/views/search_tab.dart';
import 'package:movies/features/settings/views/settings_tab.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  List<Widget> views = [
    const HomeView(),
    BlocProvider(
      create: (context) => getIt.get<SearchMoviesCubit>(),
      child: const SearchTab(),
    ),
    const CategoriesTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: views[currentIndex]),
      bottomNavigationBar: CustomCurvedBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
