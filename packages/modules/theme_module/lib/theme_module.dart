import 'package:flutter/material.dart';
import 'package:modular_module/modular_module.dart';

import 'src/l10n/theme_localizations.dart';
import 'src/theme_page.dart';

class ThemeModule implements ModularModule {
  @override
  WidgetBuilder get title => ThemePage.title;

  @override
  WidgetBuilder get body => ThemePage.body;

  @override
  LocalizationsDelegate get localizations => ThemeLocalizations.delegate;
}
