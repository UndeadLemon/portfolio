import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          switch (_selectedIndex) {
            case 0:
              {
                context.go("/");
              }
              break;
            case 1:
              {
                context.go("/blog");
              }
              break;
            case 2:
              {
                context.go("/projects");
              }
              break;
          }
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
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.chat_bubble_outline),
          label: Text('Blog'),
          selectedIcon: Icon(Icons.chat_bubble),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.folder_outlined),
          label: Text('Projects'),
          selectedIcon: Icon(Icons.folder),
        ),
      ],
    );
  }
}
