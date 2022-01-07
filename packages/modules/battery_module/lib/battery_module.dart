import 'package:flutter/material.dart';
import 'package:modular_module/modular_module.dart';
import 'package:provider/provider.dart';

import 'src/l10n/battery_localizations.dart';
import 'src/battery_page.dart';
import 'src/battery_service.dart';

class BatteryModule implements ModularModule {
  @override
  WidgetBuilder get title => BatteryPage.title;

  @override
  WidgetBuilder get body => BatteryPage.body;

  @override
  LocalizationsDelegate get localizations => BatteryLocalizations.delegate;

  @override
  InheritedProvider get provider {
    return Provider<BatteryService>(
      create: (_) => BatteryService(),
      dispose: (_, service) => service.close(),
    );
  }
}
