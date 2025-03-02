import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/models/actor_response.dart';
import 'package:movies/features/home/data/repos/home_repo.dart';
import 'package:movies/features/home/logic/actors_cubit/actors_state.dart';

class ActorsCubit extends Cubit<ActorsState> {
  final HomeRepo _homeRepo;
  ActorsCubit(this._homeRepo) : super(const ActorsInitial());
  late List<ActorResponse> actors;
  Future<void> emitActorsState() async {
    emit(const ActorsLoading());
    var response = await _homeRepo.getActors();
    response.fold(
      (failure) {
        emit(ActorsError(failure.errorMessage));
      },
      (actors) {
        emit(ActorsSuccess(actors));
        this.actors = actors.results!;
      },
    );
  }
}
