import 'package:auto_route/auto_route.dart';
import 'package:firetest/auth/firebase_app_instances.dart';

import 'router_provider.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final isLoggedIn = fbAuth.currentUser != null;

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      resolver.redirectUntil(const SignInRoute());
    }
  }
}
