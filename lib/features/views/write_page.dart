import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

class WritePage extends ConsumerWidget {
  const WritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        spacing: 20,
        children: [
          FTextField.multiline(
            label: const Text('Writer : asuracoder'),
            description: const Text('오늘 있었던 일을 기록해주세요.'),
            minLines: 8,
          ),
          FButton(
            label: const Text('Save'),
            onPress: () {
              // Form is valid, do something.
            },
          ),
        ],
      ),
    );
  }
}
