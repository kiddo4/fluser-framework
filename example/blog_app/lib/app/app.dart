import 'package:fluser/framework.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/home/pages/home_page.dart';


class MyApp extends StatelessWidget {
  final HydrationController hydrationController;

  MyApp({Key? key, required this.hydrationController}) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      // Additional routes can be added here
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fluser Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
