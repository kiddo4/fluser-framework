import 'dart:io';
import 'package:path/path.dart' as path;

class ProjectTemplate {
  static Future<void> generate(String projectName) async {
    // Generate app structure first
    await _generateAppStructure(projectName);

    // Generate pubspec.yaml
    await File(path.join(projectName, 'pubspec.yaml')).writeAsString('''
name: $projectName
description: A Fluser web application
version: 1.0.0
environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  fluser: 
    path: /Users/kiddo/Documents/fluser-framework
  provider: ^6.0.5
  go_router: ^10.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.6
''');

    // Generate main.dart
    await File(path.join(projectName, 'lib', 'main.dart')).writeAsString('''
import 'package:flutter/material.dart';
import 'package:fluser/framework.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: const MyApp(),
    ),
  );
}
''');
  }

  static Future<void> _generateAppStructure(String projectName) async {
    final directories = [
      'lib/app',
      'lib/features',
      'lib/shared',
      'lib/config',
      'server',
      'lib', // Ensure the lib directory is created
    ];

    for (final dir in directories) {
      await Directory(path.join(projectName, dir)).create(recursive: true);
    }
  }
}
