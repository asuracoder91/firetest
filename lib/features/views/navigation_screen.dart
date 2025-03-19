import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../router/router_provider.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), WriteRoute(), ProfileRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return FScaffold(
          header: FHeader(title: const Text('Firepod')),
          content: child,
          footer: FBottomNavigationBar(
            index: tabsRouter.activeIndex,
            onChange: (int index) => tabsRouter.setActiveIndex(index),
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
      },
    );
  }
}
