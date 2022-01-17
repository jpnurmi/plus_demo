import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/network_info_localizations.dart';
import 'src/network_info_page.dart';

class NetworkInfoModule implements PlusModule {
  NetworkInfoModule() {
    registerPlugin<NetworkInfo>(() => NetworkInfo());
  }

  @override
  WidgetBuilder get title => NetworkInfoPage.title;

  @override
  WidgetBuilder get body => NetworkInfoPage.body;

  @override
  LocalizationsDelegate get localizations => NetworkInfoLocalizations.delegate;
}
