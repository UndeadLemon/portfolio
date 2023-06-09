// Import Libraries
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import any custom widgets
import 'package:portfolio/src/view/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initializedApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializedApp,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            'Something went wrong! Try reloading.',
            textDirection: TextDirection.ltr,
          );
        } else if (snapshot.hasData) {
          return MaterialApp.router(
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            debugShowCheckedModeBanner: false,
          );
        } else {
          return const Center(
            child: SizedBox(
                height: 200, width: 200, child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomePage()),
  GoRoute(path: '/blog', builder: (context, state) => const Placeholder())
]);
