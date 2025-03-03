import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_constants.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Sign Up')),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            FTextField(label: const Text('Nickname'), hint: "Devil"),
            FTextField.email(label: const Text('Email'), hint: "Email"),
            FTextField.password(
              label: const Text('Password'),
              hint: "Password",
            ),
            const SizedBox(height: 10),
            FButton(label: const Text('Sign Up'), onPress: () {}),
            const SizedBox(height: 30),
            FButton(
              label: const Text('If you have an account, sign in'),
              style: FButtonStyle.ghost,
              onPress: () => context.goNamed(RouteNames.signin),
            ),
          ],
        ),
      ),
    );
  }
}
