import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:fluser/framework.dart';

void main() async {
  final app = Router();
  final serverConfig = ServerConfig(
    port: 8080,
    enableSSR: true,
    enableISR: true,
  );

  final runtime = FlutterServerRuntime();
  await runtime.initialize(serverConfig);

  app.get('/', _handleHome);
  app.get('/post/<id>', _handleBlogPost);
  app.get('/api/posts', _handleGetPosts);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(_corsMiddleware())
      .addHandler(app);

  final server = await shelf_io.serve(handler, 'localhost', 8080);
  print('Server running on port ${server.port}');
}

Future<Response> _handleHome(Request request) async {
  final preRenderer = PreRenderer();
  final content =
      await preRenderer.renderPage('/', {'posts': await _getPosts()});
  return Response.ok(content, headers: {'content-type': 'text/html'});
}

Future<Response> _handleBlogPost(Request request, String id) async {
  final preRenderer = PreRenderer();
  final post = await _getPost(id);
  final content = await preRenderer.renderPage('/post/$id', {'post': post});
  return Response.ok(content, headers: {'content-type': 'text/html'});
}

Future<Response> _handleGetPosts(Request request) async {
  final posts = await _getPosts();
  return Response.ok(
    jsonEncode({'posts': posts}),
    headers: {'content-type': 'application/json'},
  );
}

Future<List<Map<String, dynamic>>> _getPosts() async {
  // Implement database or API call
  return [
    {
      'id': '1',
      'title': 'Getting Started with Fluser',
      'content': 'Full content here...',
      'excerpt': 'Learn how to build SEO-friendly Flutter web apps with Fluser',
      'createdAt': DateTime.now().toIso8601String(),
    },
    // Add more posts...
  ];
}

Future<Map<String, dynamic>> _getPost(String id) async {
  final posts = await _getPosts();
  return posts.firstWhere((post) => post['id'] == id);
}

Middleware _corsMiddleware() {
  return createMiddleware(
    requestHandler: (Request request) {
      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: _corsHeaders);
      }
      return null;
    },
    responseHandler: (Response response) {
      return response.change(headers: {...response.headers, ..._corsHeaders});
    },
  );
}

final _corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Origin, Content-Type',
};
