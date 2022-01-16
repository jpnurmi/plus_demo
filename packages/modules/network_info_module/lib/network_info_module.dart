import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/network_info_localizations.dart';
import 'src/network_info_page.dart';
import 'src/network_info_service.dart';

class NetworkInfoModule implements PlusModule {
  NetworkInfoModule() {
    registerService<NetworkInfoService>(NetworkInfoService.new);
  }

  @override
  WidgetBuilder get title => NetworkInfoPage.title;

  @override
  WidgetBuilder get body => NetworkInfoPage.body;

  @override
  LocalizationsDelegate get localizations => NetworkInfoLocalizations.delegate;
}
