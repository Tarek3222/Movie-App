import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widget/custom_error_widget.dart';
import 'package:movies/features/home/logic/actors_cubit/actors_cubit.dart';
import 'package:movies/features/home/logic/actors_cubit/actors_state.dart';
import 'package:movies/features/home/views/widgets/actors_list_view.dart';
import 'package:movies/features/home/views/widgets/skeleton_actors_list_view.dart';

class ActorsBlocBuilder extends StatefulWidget {
  const ActorsBlocBuilder({super.key});

  @override
  State<ActorsBlocBuilder> createState() => _ActorsBlocBuilderState();
}

class _ActorsBlocBuilderState extends State<ActorsBlocBuilder> {
  @override
  void initState() {
    context.read<ActorsCubit>().emitActorsState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorsCubit, ActorsState>(
      builder: (context, state) {
        if (state is ActorsSuccess) {
          return ActorsListView(actors: state.actors.results!);
        } else if (state is ActorsError) {
          return CustomErrorWidget(errorMessage: state.message);
        } else {
          return const SkeletonActorsListView();
        }
      },
    );
  }
}
