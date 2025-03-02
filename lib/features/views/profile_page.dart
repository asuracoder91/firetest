import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        FCard(
          title: const Text('Profile'),
          subtitle: const Text('asuracoder@gmail.com'),

          child: Column(
            spacing: 10,
            children: [
              const SizedBox(height: 5),
              FTextField(label: const Text('Nickname'), hint: "Devil"),

              FButton(label: const Text('Edit nickname'), onPress: () {}),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: FButton(
            onPress: () {},
            label: const Text('Logout'),
            style: FButtonStyle.destructive,
          ),
        ),
      ],
    );
  }
}
