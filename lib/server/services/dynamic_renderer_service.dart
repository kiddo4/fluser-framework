import 'package:logging/logging.dart';
import '../core/pre_renderer.dart';

class DynamicRendererService {
  static final _logger = Logger('DynamicRendererService');
  final PreRenderer _preRenderer;

  DynamicRendererService(this._preRenderer);

  Future<String> renderDynamicContent(String route, Map<String, dynamic> state,
      Map<String, String> userContext) async {
    _logger.info('Rendering dynamic content for route: $route');
    try {
      // Pre-render the page with the initial state
      final renderedPage = await _preRenderer.renderPage(route, state);
      // Additional dynamic content rendering logic can be added here
      return renderedPage;
    } catch (e) {
      _logger.severe('Error rendering dynamic content', e);
      rethrow;
    }
  }
}
