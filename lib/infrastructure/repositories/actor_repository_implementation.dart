import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImplementation extends ActorsRepository {
  final ActorsDataSource dataSource;

  ActorRepositoryImplementation(this.dataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    return dataSource.getActorsByMovie(movieId);
  }
}
