import 'dart:io';
import 'package:path/path.dart' as path;

class ProjectTemplate {
  static Future<void> generate(String projectName) async {
    // Normalize project name
    projectName = projectName.replaceAll('-', '_').replaceAll(' ', '_');

    // Generate app structure first
    await _generateAppStructure(projectName);

    // Generate pubspec.yaml
    await File(path.join(projectName, 'pubspec.yaml')).writeAsString('''
name: $projectName
description: A Fluser application
version: 1.0.0
environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  fluser: 
    path: /Users/kiddo/Documents/fluser-framework
  go_router: ^10.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.6
''');

    // Generate main.dart
    await File(path.join(projectName, 'lib', 'main.dart')).writeAsString('''
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  runApp(const MyApp());
}
''');

    // Generate additional files
    await _generateAdditionalFiles(projectName);
  }

  static Future<void> _generateAppStructure(String projectName) async {
    final directories = [
      'lib/app',
      'lib/features/home/pages',
      'lib/shared',
      'lib/config',
      'server',
    ];

    for (final dir in directories) {
      await Directory(path.join(projectName, dir)).create(recursive: true);
    }
  }

  static Future<void> _generateAdditionalFiles(String projectName) async {
    // Generate app.dart
    await File(path.join(projectName, 'lib', 'app', 'app.dart'))
        .writeAsString('''
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
''');

    // Generate a default home page
    await File(path.join(
            projectName, 'lib', 'features', 'home', 'pages', 'home_page.dart'))
        .writeAsString('''
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(child: const Text('Welcome to the Fluser Application!')),
    );
  }
}
''');

    // Generate an example file for shared
    await File(path.join(projectName, 'lib', 'shared', 'example.dart'))
        .writeAsString('''
class Example {
  static const String message = 'This is an example file in the shared folder.';
}
''');

    // Generate an example file for config
    await File(path.join(projectName, 'lib', 'config', 'app_config.dart'))
        .writeAsString('''
class AppConfig {
  static const String apiUrl = 'https://api.example.com';
}
''');

    // Generate an example file for server
    await File(path.join(projectName, 'server', 'server.dart'))
        .writeAsString('''
import 'dart:io';

void main() {
  print('Server is running...');
  // Implement server logic here
}
''');
  }
}
