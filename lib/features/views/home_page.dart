import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        children: [
          FCard(
            title: const Text('제목제목제목'),
            subtitle: const Text('Devil'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("내용내용내용"),
                Column(
                  children: [
                    FButton.icon(
                      style: FButtonStyle.secondary,
                      child: FIcon(FAssets.icons.pen),
                      onPress: () {},
                    ),
                    const SizedBox(height: 10),
                    FButton.icon(
                      style: FButtonStyle.secondary,
                      child: FIcon(FAssets.icons.x),
                      onPress: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
