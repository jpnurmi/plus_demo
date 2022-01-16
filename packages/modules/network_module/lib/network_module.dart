import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/network_localizations.dart';
import 'src/network_page.dart';
import 'src/network_service.dart';

class NetworkModule implements PlusModule {
  NetworkModule() {
    registerService<NetworkService>(NetworkService.new);
  }

  @override
  WidgetBuilder get title => NetworkPage.title;

  @override
  WidgetBuilder get body => NetworkPage.body;

  @override
  LocalizationsDelegate get localizations => NetworkLocalizations.delegate;
}
