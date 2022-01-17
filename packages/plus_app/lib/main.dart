import 'package:battery_module/battery_module.dart';
import 'package:connectivity_module/connectivity_module.dart';
import 'package:device_info_module/device_info_module.dart';
import 'package:flutter/widgets.dart';
import 'package:network_info_module/network_info_module.dart';
import 'package:package_info_module/package_info_module.dart';
import 'package:plus_core/plus_core.dart';

import 'app.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  runApp(PlusApp(
    locale: binding.window.locale,
    modules: <PlusModule>[
      BatteryModule(),
      ConnectivityModule(),
      DeviceInfoModule(),
      NetworkInfoModule(),
      PackageInfoModule(),
    ],
  ));
}
