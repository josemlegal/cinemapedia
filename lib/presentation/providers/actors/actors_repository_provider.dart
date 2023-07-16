import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_implementation.dart';
import 'package:riverpod/riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImplementation(
    ActorMovieDbDataSource(),
  );
});
