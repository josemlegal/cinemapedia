import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return NavigationBar(
      elevation: 0,
      indicatorColor: colors.inversePrimary,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: size.height * 0.1,
      backgroundColor: colors.background,
      selectedIndex: currentIndex,
      onDestinationSelected: (value) => onItemTapped(context, value),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.movie_outlined),
          label: 'Movies',
        ),
        NavigationDestination(
          icon: Icon(Icons.label_outlined),
          label: 'Categories',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outlined),
          label: 'Favorites',
        ),
      ],
    );
  }
}
