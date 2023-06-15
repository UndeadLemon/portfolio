// Import Libraries
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/src/view/widgets/nav_rail.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import any custom widgets
import 'package:portfolio/src/view/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter _router = GoRouter(routes: [
  ShellRoute(
      builder: (_, GoRouterState state, child) {
        return Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                const AppNavigationRail(),
                Expanded(child: child),
              ],
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/blog',
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: '/projects',
          builder: (context, state) => const Placeholder(),
        ),
      ])
]);
