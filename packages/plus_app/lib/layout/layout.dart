import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';

import 'landscape_layout.dart';
import 'portrait_layout.dart';

class PlusLayout extends StatefulWidget {
  const PlusLayout({
    Key? key,
    required this.modules,
    this.actions,
  }) : super(key: key);

  final List<PlusModule> modules;
  final List<Widget>? actions;

  @override
  State<PlusLayout> createState() => _PlusLayoutState();
}

class _PlusLayoutState extends State<PlusLayout> {
  var _index = -1;
  var _previousIndex = 0;

  void _setIndex(int index) {
    _previousIndex = _index;
    _index = index;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        switch (orientation) {
          case Orientation.portrait:
            return PortraitLayout(
              index: _index,
              modules: widget.modules,
              onSelected: _setIndex,
              actions: widget.actions,
            );
          case Orientation.landscape:
            return LandscapeLayout(
              index: _index == -1 ? _previousIndex : _index,
              modules: widget.modules,
              onSelected: _setIndex,
              actions: widget.actions,
            );
        }
      },
    );
  }
}
