import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/package_info_localizations.dart';
import 'src/package_info_page.dart';

class PackageInfoModule implements PlusModule {
  @override
  WidgetBuilder get title => PackageInfoPage.title;

  @override
  WidgetBuilder get body => PackageInfoPage.body;

  @override
  LocalizationsDelegate get localizations => PackageInfoLocalizations.delegate;
}
