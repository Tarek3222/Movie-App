import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helper/spacing.dart';
import 'package:movies/features/search/views/widgets/results_search_bloc_builder.dart';
import 'package:movies/features/search/views/widgets/search_field.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: Column(
          children: [
            const SearchField(),
            verticalSpace(16),
            const Expanded(
              child: ResultsSearchBlocBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
