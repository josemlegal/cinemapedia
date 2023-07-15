import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_implementation.dart';
import 'package:riverpod/riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImplementation(
    MovieDbDataSource(),
  );
});
