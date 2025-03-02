import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(content: Column(children: [Text('Home')]));
  }
}
