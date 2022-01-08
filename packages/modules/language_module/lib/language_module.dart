import 'package:flutter/material.dart';
import 'package:modular_module/modular_module.dart';

import 'src/l10n/language_localizations.dart';
import 'src/language_page.dart';

class LanguageModule implements ModularModule {
  @override
  WidgetBuilder get title => LanguagePage.title;

  @override
  WidgetBuilder get body => LanguagePage.body;

  @override
  LocalizationsDelegate get localizations => LanguageLocalizations.delegate;
}
