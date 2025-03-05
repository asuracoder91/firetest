import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_constants.dart';
import '../repos/auth_repository_provider.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final nicknameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nicknameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(title: const Text('Sign Up')),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            FTextField(
              label: const Text('Nickname'),
              hint: "Devil",
              controller: nicknameController,
            ),
            FTextField.email(
              label: const Text('Email'),
              hint: "Email",
              controller: emailController,
            ),
            FTextField.password(
              label: const Text('Password'),
              hint: "Password",
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            FButton(
              label: const Text('Sign Up'),
              onPress: () async {
                try {
                  await ref
                      .read(authRepositoryProvider)
                      .signup(
                        nickname: nicknameController.text,
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
