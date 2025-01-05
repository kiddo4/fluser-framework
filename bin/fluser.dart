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
  print('Building project...');
  // Implementation for building project
}

Future<void> generateComponent(ArgResults args) async {
  print('Generating component...');
  // Implementation for generating components
}
