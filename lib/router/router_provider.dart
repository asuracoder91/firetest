import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/views/sign_in.dart';
import '../auth/views/sign_up.dart';
import '../features/views/home_page.dart';
import '../features/views/navigation_screen.dart';
import '../features/views/profile_page.dart';
import '../features/views/write_page.dart';
import 'router_names.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter route(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.signup,
    routes: [
      GoRoute(
        path: RouteNames.signin,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: RouteNames.signup,
        builder: (context, state) => const SignUp(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.write,
                builder: (context, state) => const WritePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
