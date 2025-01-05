import 'dart:async';
import 'package:logging/logging.dart';

class ServerStateManager {
  static final _logger = Logger('ServerStateManager');
  final _stateController = StreamController<Map<String, dynamic>>.broadcast();
  final Map<String, dynamic> _serverState = {};

  Stream<Map<String, dynamic>> get stateStream => _stateController.stream;

  void updateState(String key, dynamic value) {
    _logger.fine('Updating server state: $key');
    _serverState[key] = value;
    _stateController.add({key: value});
  }

  Map<String, dynamic> get currentState => Map.from(_serverState);
}
