import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/repos/auth_repository_provider.dart';
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
  final authState = ref.watch(authStateStreamProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteURL.signup,
    redirect: (context, state) {
      if (authState is AsyncLoading<User?>) {
        return RouteURL.signin;
      }

      final authenticated = authState.valueOrNull != null;

      final authenticating =
          (state.matchedLocation == RouteURL.signin) ||
          (state.matchedLocation == RouteURL.signup);

      if (authenticated == false) {
        return authenticating ? null : RouteURL.signin;
      }

      return (authenticating) ? RouteURL.home : null;
    },
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
