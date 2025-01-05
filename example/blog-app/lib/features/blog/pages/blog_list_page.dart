import 'package:fluser/framework.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../blog_provider.dart';

class BlogListPage extends HydratedWidget {
  const BlogListPage({Key? key}) : super(id: 'blog-list', key: key);

  @override
  State<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends HydratedState<BlogListPage> {
  @override
  Widget build(BuildContext context) {
    final blogProvider = context.watch<BlogProvider>();
    
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Posts')),
      body: ListView.builder(
        itemCount: blogProvider.posts.length,
        itemBuilder: (context, index) {
          final post = blogProvider.posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.excerpt),
            onTap: () => context.go('/post/${post.id}'),
          );
        },
      ),
    );
  }

  @override
  Map<String, dynamic> get hydratedData => {
    'posts': context.read<BlogProvider>().posts,
  };
}