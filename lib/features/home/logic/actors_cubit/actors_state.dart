import 'package:movies/features/home/data/models/actor_response.dart';

abstract class ActorsState {
  const ActorsState();
}

// !Actors
class ActorsInitial extends ActorsState {
  const ActorsInitial();
}

class ActorsLoading extends ActorsState {
  const ActorsLoading();
}

class ActorsSuccess extends ActorsState {
  final ActorListResponse actors;
  const ActorsSuccess(this.actors);
}

class ActorsError extends ActorsState {
  final String message;
  const ActorsError(this.message);
}
