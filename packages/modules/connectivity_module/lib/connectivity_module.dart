import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/connectivity_localizations.dart';
import 'src/connectivity_page.dart';

class ConnectivityModule implements PlusModule {
  ConnectivityModule() {
    registerPlugin(() => Connectivity());
  }

  @override
  WidgetBuilder get title => ConnectivityPage.title;

  @override
  WidgetBuilder get body => ConnectivityPage.body;

  @override
  LocalizationsDelegate get localizations => ConnectivityLocalizations.delegate;
}
