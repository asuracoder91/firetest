import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

const List<Widget> _pages = [Text('Home'), Text('Write'), Text('Profile')];

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    builder:
        (context, child) => FTheme(
          data:
              MediaQuery.platformBrightnessOf(context) == Brightness.dark
                  ? FThemes.zinc.dark
                  : FThemes.zinc.light,
          child: child!,
        ),
    home: FScaffold(
      header: FHeader(title: const Text('Firepod')),
      content: _pages[index],
      footer: FBottomNavigationBar(
        index: index,
        onChange: (index) => setState(() => this.index = index),
        children: [
          FBottomNavigationBarItem(
            icon: FIcon(FAssets.icons.house),
            label: const Text('Home'),
          ),
          FBottomNavigationBarItem(
            icon: FIcon(FAssets.icons.pencil),
            label: const Text('Write'),
          ),
          FBottomNavigationBarItem(
            icon: FIcon(FAssets.icons.user),
            label: const Text('Profile'),
          ),
        ],
      ),
    ),
  );
}
