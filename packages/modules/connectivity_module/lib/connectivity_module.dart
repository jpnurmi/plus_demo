import 'package:flutter/material.dart';
import 'package:modular_interface/modular_interface.dart';

import 'src/l10n/connectivity_localizations.dart';
import 'src/connectivity_page.dart';
import 'src/connectivity_service.dart';

class ConnectivityModule implements ModularModule {
  ConnectivityModule() {
    registerService<ConnectivityService>(ConnectivityService.new);
  }

  @override
  WidgetBuilder get title => ConnectivityPage.title;

  @override
  WidgetBuilder get body => ConnectivityPage.body;

  @override
  LocalizationsDelegate get localizations => ConnectivityLocalizations.delegate;
}
