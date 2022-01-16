import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/device_localizations.dart';
import 'src/device_page.dart';
import 'src/device_service.dart';

class DeviceModule implements PlusModule {
  DeviceModule() {
    registerService<DeviceService>(DeviceService.new);
  }

  @override
  WidgetBuilder get title => DevicePage.title;

  @override
  WidgetBuilder get body => DevicePage.body;

  @override
  LocalizationsDelegate get localizations => DeviceLocalizations.delegate;
}
