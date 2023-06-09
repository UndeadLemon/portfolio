import 'package:flutter/material.dart';
import 'package:portfolio/src/view/widgets/nav_rail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(children: <Widget>[
        AppNavigationRail(),
        Text('Currently a blank home page.')
      ]),
    );
  }
}
