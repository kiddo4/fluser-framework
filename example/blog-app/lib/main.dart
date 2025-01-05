import 'package:flutter/material.dart';
import 'package:fluser/framework.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'features/blog/blog_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BlogProvider()),
      ],
      child: BlogApp(),
    ),
  );
}