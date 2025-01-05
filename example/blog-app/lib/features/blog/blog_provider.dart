import 'package:flutter/foundation.dart';
import 'models/blog_post.dart';

class BlogProvider extends ChangeNotifier {
  List<BlogPost> _posts = [];
  
  List<BlogPost> get posts => _posts;
  
  Future<void> fetchPosts() async {
    // Implement API call
    _posts = [
      BlogPost(
        id: '1',
        title: 'Getting Started with Fluser',
        content: 'Full content here...',
        excerpt: 'Learn how to build SEO-friendly Flutter web apps with Fluser',
        createdAt: DateTime.now(),
      ),
      // Add more posts...
    ];
    notifyListeners();
  }
}