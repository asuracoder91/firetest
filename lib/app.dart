import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import 'router/router_provider.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    return MaterialApp.router(
      builder:
          (context, child) => FTheme(
            data:
                MediaQuery.platformBrightnessOf(context) == Brightness.dark
                    ? FThemes.zinc.dark
                    : FThemes.zinc.light,
            child: child!,
          ),
      routerConfig: router,
    );
  }
}
