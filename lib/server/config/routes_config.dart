import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class RoutesConfig {
  final Router router;

  RoutesConfig() : router = Router() {
    _setupRoutes();
  }

  void _setupRoutes() {
    router.get('/', (request) {
      return Response.ok('Welcome to Fluser!');
    });
    // Add more routes here
  }

  Router get appRouter => router;
}
