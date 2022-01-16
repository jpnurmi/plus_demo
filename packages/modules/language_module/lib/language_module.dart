import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'src/l10n/language_localizations.dart';
import 'src/language_page.dart';

class LanguageModule implements PlusModule {
  @override
  WidgetBuilder get title => LanguagePage.title;

  @override
  WidgetBuilder get body => LanguagePage.body;

  @override
  LocalizationsDelegate get localizations => LanguageLocalizations.delegate;
}
