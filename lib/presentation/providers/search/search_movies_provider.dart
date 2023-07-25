import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:riverpod/riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  SearchMoviesCallback searchMovies;

  SearchedMoviesNotifier({
    required this.searchMovies,
  }) : super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);

    state = movies;
    return movies;
  }
}
