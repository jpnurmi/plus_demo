import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/device_info_localizations.dart';
import 'src/device_info_page.dart';

class DeviceInfoModule implements PlusModule {
  DeviceInfoModule() {
    registerPlugin(() => DeviceInfoPlugin());
  }

  @override
  WidgetBuilder get title => DeviceInfoPage.title;

  @override
  WidgetBuilder get body => DeviceInfoPage.body;

  @override
  LocalizationsDelegate get localizations => DeviceInfoLocalizations.delegate;
}
