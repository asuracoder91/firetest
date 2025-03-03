import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_constants.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Sign In')),

      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            FTextField.email(label: const Text('Email'), hint: "Email"),
            FTextField.password(
              label: const Text('Password'),
              hint: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),
            FButton(label: const Text('Sign In'), onPress: () {}),
            const SizedBox(height: 30),
            FButton(
              label: const Text("Create an account"),
              style: FButtonStyle.ghost,
              onPress: () => context.goNamed(RouteNames.signup),
            ),
          ],
        ),
      ),
    );
  }
}
