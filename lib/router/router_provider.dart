import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/views/sign_in.dart';
import '../auth/views/sign_up.dart';
import '../features/views/home_page.dart';
import '../features/views/navigation_screen.dart';
import '../features/views/profile_page.dart';
import '../features/views/write_page.dart';
import 'router_constants.dart';

part 'router_provider.g.dart';
part 'router_provider.gr.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
Raw<RootStackRouter> router(Ref ref) {
  return Raw<RootStackRouter>(AppRouter());
}

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter() : super(navigatorKey: _rootNavigatorKey);

  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: RoutePath.signin, page: SignInRoute.page),
    AutoRoute(path: RoutePath.signup, page: SignUpRoute.page),
    AutoRoute(
      path: '/',
      page: NavigationRoute.page,
      initial: true,
      children: [
        AutoRoute(initial: true, path: RoutePath.home, page: HomeRoute.page),
        AutoRoute(path: RoutePath.write, page: WriteRoute.page),
        AutoRoute(path: RoutePath.profile, page: ProfileRoute.page),
      ],
    ),
  ];
}
