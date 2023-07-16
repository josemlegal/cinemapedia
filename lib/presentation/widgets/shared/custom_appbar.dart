import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(
              Icons.movie_outlined,
              color: colors.primary,
            ),
            const SizedBox(width: 8.0),
            Text('Cinemapedia', style: titleStyle),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                final movieRepository = ref.read(movieRepositoryProvider);
                showSearch(
                  context: context,
                  delegate: SearchMovieDelegate(
                      searchMovies: movieRepository.searchMovies),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
