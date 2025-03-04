import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_constants.dart';
import '../repos/auth_repository_provider.dart';

class SignIn extends ConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return FScaffold(
      header: FHeader(title: const Text('Sign In')),

      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            FTextField.email(
              label: const Text('Email'),
              hint: "Email",
              controller: emailController,
            ),
            FTextField.password(
              label: const Text('Password'),
              hint: "Password",
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            FButton(
              label: const Text('Sign In'),
              onPress: () async {
                try {
                  await ref
                      .read(authRepositoryProvider)
                      .signin(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                  if (context.mounted) {
                    context.goNamed(RouteNames.home);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
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
