import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

    if (favoritesMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
            Text('Ohhhh no!!!',
                style: TextStyle(fontSize: 30, color: colors.primary)),
            const Text('No tienes peliculas favoritas',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 20),
            FilledButton.tonal(
                onPressed: () => context.go('/home/0'),
                child: const Text("Empieza a buscar"))
          ],
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(
        loadNexPage: loadNexPage,
        movies: favoritesMovies,
      ),
    );
  }
}
