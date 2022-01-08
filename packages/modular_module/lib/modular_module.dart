library modular_module;

import 'package:flutter/material.dart';

abstract class ModularModule {
  WidgetBuilder get title;
  WidgetBuilder get body;
  LocalizationsDelegate? get localizations;
}
