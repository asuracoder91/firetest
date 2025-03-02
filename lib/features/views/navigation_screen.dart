import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Firepod')),
      content: navigationShell,
      footer: FBottomNavigationBar(
        index: navigationShell.currentIndex,
        onChange: (int index) => _onTap(context, index),
        children: [
          FBottomNavigationBarItem(
            icon: FIcon(FAssets.icons.house),
            label: const Text('Home'),
          ),
          FBottomNavigationBarItem(
            icon: FIcon(FAssets.icons.pencil),
            label: const Text('Write'),
          ),
          FBottomNavigationBarItem(
            icon: FIcon(FAssets.icons.user),
            label: const Text('Profile'),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
