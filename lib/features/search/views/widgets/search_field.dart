import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/widget/app_text_form_field.dart';
import 'package:movies/features/search/logic/cubit/search_movies_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      onChanged: (value) {
        context.read<SearchMoviesCubit>().searchMovies(query: value);
      },
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.grey,
        size: 24,
      ),
      hintText: 'Search now....',
    ).animate().fade().slide();
  }
}
