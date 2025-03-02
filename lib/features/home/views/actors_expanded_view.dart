import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_styles.dart';
import 'package:movies/features/home/data/models/actor_response.dart';
import 'package:movies/features/home/views/widgets/custom_actor_widget.dart';

class ActorsExpandedView extends StatelessWidget {
  const ActorsExpandedView(
      {super.key, required this.title, required this.actors});
  final String title;
  final List<ActorResponse> actors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          title,
          style: AppStyles.font24WhiteBold,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: buildActorsGridView(),
    );
  }

  GridView buildActorsGridView() {
    return GridView.builder(
      itemCount: actors.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) => CustomActorWidget(
        actor: actors[index],
      ),
    );
  }
}
