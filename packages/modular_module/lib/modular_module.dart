library modular_module;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ModularModule {
  WidgetBuilder get title;
  WidgetBuilder get body;
  LocalizationsDelegate? get localizations;
  InheritedProvider? get provider;
}
