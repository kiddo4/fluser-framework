import 'dart:async';
import 'package:flutter/foundation.dart';

class ClientState extends ChangeNotifier {
  Map<String, dynamic> _state = {};
  final _stateController = StreamController<Map<String, dynamic>>.broadcast();
  
  Stream<Map<String, dynamic>> get stateStream => _stateController.stream;
  
  void updateState(String key, dynamic value) {
    _state[key] = value;
    _stateController.add({key: value});
    notifyListeners();
  }

  Map<String, dynamic> get currentState => Map.from(_state);
}

