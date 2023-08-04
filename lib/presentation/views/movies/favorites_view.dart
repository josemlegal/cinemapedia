import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool islastPage = false;
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    loadNexPage();
  }

  void loadNexPage() async {
    if (islastPage || isloading) return;
    isloading = true;
    final movies =
        await ref.read(favoritesMoviesProvider.notifier).loadNextPage();
    isloading = false;
    if (movies.isEmpty) {
      islastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoritesMoviesProvider).values.toList();
    return Scaffold(
      body: MovieMasonry(
        loadNexPage: loadNexPage,
        movies: favoritesMovies,
      ),
    );
  }
}
