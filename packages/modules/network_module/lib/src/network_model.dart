import 'dart:async';

import 'package:flutter/foundation.dart';
import 'network_service.dart';

class NetworkModel extends ChangeNotifier {
  NetworkModel(this._service);

  final NetworkService _service;
  String? _ip;
  String? _name;

  String? get ip => _ip;
  String? get name => _name;

  Future<void> init() async {
    await _service.init();
    _ip = await _service.getIP();
    _name = await _service.getName();
    notifyListeners();
  }
}
