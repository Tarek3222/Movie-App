import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/models/actor_response.dart';
import 'package:movies/features/home/views/widgets/custom_actor_widget.dart';

class ActorsListView extends StatelessWidget {
  const ActorsListView({super.key, required this.actors});
  final List<ActorResponse> actors;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 10.w : 0, right: 8.w, top: 5.h),
            child: CustomActorWidget(
              actor: actors[index],
            ),
          );
        },
      ),
    );
  }
}
