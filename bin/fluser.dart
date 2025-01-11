import 'dart:io';
import 'package:args/args.dart';
import 'package:fluser/templates/default_template.dart';
// import 'package:path/path.dart' as path;
// import 'package:yaml/yaml.dart';

void main(List<String> args) async {
  final parser = ArgParser()
    ..addCommand('create')
    ..addCommand('build')
    ..addCommand('serve')
    ..addCommand('generate')
    ..addOption('template', abbr: 't', defaultsTo: 'default')
    ..addFlag('help', abbr: 'h', negatable: false)
    ..addFlag('verbose', abbr: 'v', negatable: false);

  try {
    final results = parser.parse(args);
    if (results.command?.name == 'create') {
      await createProject(results);
    } else if (results.command?.name == 'serve') {
      await serveProject(results);
    } else if (results.command?.name == 'build') {
      await buildProject(results);
    } else if (results.command?.name == 'generate') {
      await generateComponent(results);
    }
  } catch (e) {
    print('Error: $e');
    exit(1);
  }
}

Future<void> createProject(ArgResults args) async {
  final projectName = args.command!.rest.first;
  print('Creating Fluser project: $projectName');

  // Create project directory
  final dir = Directory(projectName);
  await dir.create();

  // Generate app structure
  await ProjectTemplate.generate(projectName);

  // // Initialize Git repository
  // await Process.run('git', ['init'], workingDirectory: projectName);

  print('Project created successfully! 🚀');
  print('\nNext steps:');
  print('  cd $projectName');
  print('  flutter pub get');
  print('  fluser serve');
}

Future<void> serveProject(ArgResults args) async {
  print('Starting development server...');
  await Future.wait([
    Process.start('dart', ['run', 'bin/server.dart'],
        mode: ProcessStartMode.inheritStdio),
    Process.start('flutter', ['run', '-d', 'chrome'],
        mode: ProcessStartMode.inheritStdio),
  ]);
}

Future<void> buildProject(ArgResults args) async {
  final projectName = args.command!.rest.first;
  print('Building project: $projectName');

  // Run the Flutter build command
  final result =
      await Process.run('flutter', ['build'], workingDirectory: projectName);

  if (result.exitCode == 0) {
    print('Project built successfully!');
  } else {
    print('Build failed: ${result.stderr}');
  }
}

Future<void> generateComponent(ArgResults args) async {
  final projectName = args.command!.rest.first;
  final componentName =
      args.command!.rest.length > 1 ? args.command!.rest[1] : 'NewComponent';

  print('Generating component: $componentName in project: $projectName');

  // Create the component file
  final componentFile =
      File('${projectName}/lib/components/$componentName.dart');
  await componentFile.create(recursive: true);

  // Write a basic widget structure to the file
  await componentFile.writeAsString('''
import 'package:flutter/material.dart';

class $componentName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$componentName'),
    );
  }
}
''');

  print('Component $componentName generated successfully!');
}
