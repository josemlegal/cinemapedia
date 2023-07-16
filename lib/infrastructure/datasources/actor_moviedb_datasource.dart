import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_reponse.dart';
import 'package:dio/dio.dart';

import '../../core/constants/environment.dart';

class ActorMovieDbDataSource extends ActorsDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castReponse = CreditsReponse.fromJson(response.data);

    List<Actor> actors =
        castReponse.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
  }
}
