import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/battery_localizations.dart';
import 'src/battery_page.dart';

class BatteryModule implements PlusModule {
  BatteryModule() {
    registerPlugin(() => Battery());
  }

  @override
  WidgetBuilder get title => BatteryPage.title;

  @override
  WidgetBuilder get body => BatteryPage.body;

  @override
  LocalizationsDelegate get localizations => BatteryLocalizations.delegate;
}
