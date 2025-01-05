import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/blog/pages/blog_list_page.dart';

class BlogApp extends StatelessWidget {
  BlogApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const BlogListPage(),
      ),
      // GoRoute(
      //   path: '/post/:id',
      //   builder: (context, state) => BlogDetailPage(
      //     id: state.params['id']!,
      //   ),
      // ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fluser Blog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}