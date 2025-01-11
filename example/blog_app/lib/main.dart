import 'package:fluser/framework.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  final Map<String, dynamic> initialState = {}; 
  final hydrationController = HydrationController(initialState);

  runApp(MyApp(hydrationController: hydrationController));
}
