import 'package:flutter/widgets.dart';

abstract class PlusModule {
  WidgetBuilder get title;
  WidgetBuilder get body;
  LocalizationsDelegate? get localizations;
}
