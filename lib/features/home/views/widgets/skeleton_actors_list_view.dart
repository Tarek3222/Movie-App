import 'package:flutter/widgets.dart';
import 'package:movies/core/networking/api_constants.dart';
import 'package:movies/features/home/data/models/actor_response.dart';
import 'package:movies/features/home/views/widgets/actors_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonActorsListView extends StatelessWidget {
  const SkeletonActorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ActorsListView(actors: testActors),
    );
  }
}

List<ActorResponse> testActors = List.generate(
    10,
    (index) => ActorResponse(
          adult: false,
          gender: 1,
          id: index,
          knownForDepartment: 'Acting',
          name: 'Actor $index',
          originalName: '',
          popularity: 0,
          profilePath:
              '${ApiConstants.baseUrlImage}/c4sKOIJNubiSZnv58s7W3Bdmwb.jpg',
        ));
