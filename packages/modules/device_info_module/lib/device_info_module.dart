import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/device_info_localizations.dart';
import 'src/device_info_page.dart';
import 'src/device_info_service.dart';

class DeviceInfoModule implements PlusModule {
  DeviceInfoModule() {
    registerService<DeviceInfoService>(DeviceInfoService.new);
  }

  @override
  WidgetBuilder get title => DeviceInfoPage.title;

  @override
  WidgetBuilder get body => DeviceInfoPage.body;

  @override
  LocalizationsDelegate get localizations => DeviceInfoLocalizations.delegate;
}
