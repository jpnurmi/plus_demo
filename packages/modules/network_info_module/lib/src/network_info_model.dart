import 'dart:async';

import 'package:flutter/foundation.dart';
import 'network_info_service.dart';

class NetworkInfoModel extends ChangeNotifier {
  NetworkInfoModel(this._service);

  final NetworkInfoService _service;
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
