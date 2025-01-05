import 'package:flutter/material.dart';
import 'package:fluser/framework.dart';

class HomePage extends HydratedWidget {
  HomePage({Key? key}) : super(id: 'home', key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HydratedState<HomePage> {
  @override
  Map<String, dynamic> get hydratedData => {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Fluser'),
      ),
      body: Center(
        child: Text('Hello, Fluser!'),
      ),
    );
  }
}
