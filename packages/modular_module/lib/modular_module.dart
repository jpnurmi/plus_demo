library modular_module;

import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

export 'package:provider/single_child_widget.dart';

abstract class ModularModule {
  WidgetBuilder get title;
  WidgetBuilder get body;
  LocalizationsDelegate? get localizations;
  SingleChildWidget? get provider;
}
