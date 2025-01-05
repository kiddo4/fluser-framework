class BlogPost {
  final String id;
  final String title;
  final String content;
  final String excerpt;
  final DateTime createdAt;

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.createdAt,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      excerpt: json['excerpt'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'excerpt': excerpt,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
