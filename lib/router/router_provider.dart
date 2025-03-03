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
import 'router_constants.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter route(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteURL.signup,
    routes: [
      GoRoute(
        path: RouteURL.signin,
        name: RouteNames.signin,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: RouteURL.signup,
        name: RouteNames.signup,
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
                path: RouteURL.home,
                name: RouteNames.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteURL.write,
                name: RouteNames.write,
                builder: (context, state) => const WritePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteURL.profile,
                name: RouteNames.profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
