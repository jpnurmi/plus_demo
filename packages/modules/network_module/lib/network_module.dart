import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:modular_module/modular_module.dart';

import 'src/l10n/network_localizations.dart';
import 'src/network_page.dart';
import 'src/network_service.dart';

class NetworkModule implements ModularModule {
  NetworkModule() {
    GetIt.I.registerFactory<NetworkService>(() => NetworkService());
  }

  @override
  WidgetBuilder get title => NetworkPage.title;

  @override
  WidgetBuilder get body => NetworkPage.body;

  @override
  LocalizationsDelegate get localizations => NetworkLocalizations.delegate;
}
