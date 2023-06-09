import 'package:flutter/material.dart';

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail({super.key});

  @override
  State<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      groupAlignment: groupAlignment,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: labelType,
      leading: showLeading
          ? FloatingActionButton(
              onPressed: () {
                // TODO
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox(),
      trailing: showTrailing
          ? IconButton(
              onPressed: () {
                // TODO
              },
              icon: const Icon(Icons.more_horiz_rounded),
            )
          : const SizedBox(),
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home_filled),
          label: Text('Home'),
        )
      ],
    );
  }
}
