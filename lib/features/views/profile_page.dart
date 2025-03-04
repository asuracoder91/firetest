import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import '../../auth/firebase_app_instances.dart';
import '../../auth/repos/auth_repository_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final nicknameController = TextEditingController();

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uid = fbAuth.currentUser!.uid;
    final userInfo = ref.watch(userInfoProvider(uid));
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        FCard(
          title: const Text('Profile'),
          subtitle: Text(ref.watch(authRepositoryProvider).currentUser!.email!),
          child: Column(
            spacing: 10,
            children: [
              const SizedBox(height: 5),
              FTextField(
                label: const Text('Nickname'),
                hint: userInfo.value?.nickname,
                controller: nicknameController,
              ),
              FButton(label: const Text('Edit nickname'), onPress: () {}),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: FButton(
            onPress: () async {
              try {
                await ref.read(authRepositoryProvider).signout();
              } catch (e) {
                print(e);
              }
            },
            label: const Text('Logout'),
            style: FButtonStyle.destructive,
          ),
        ),
      ],
    );
  }
}
