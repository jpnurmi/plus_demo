import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modular_interface/modular_interface.dart';

class PortraitLayout extends StatefulWidget {
  const PortraitLayout({
    Key? key,
    required this.index,
    required this.modules,
    required this.onSelected,
  }) : super(key: key);

  final int index;
  final List<ModularModule> modules;
  final ValueChanged<int> onSelected;

  @override
  _PortraitLayoutState createState() => _PortraitLayoutState();
}

class _PortraitLayoutState extends State<PortraitLayout> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  MaterialPageRoute pageRoute(int index) {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: widget.modules[index].title(context),
            leading: BackButton(
              onPressed: () {
                widget.onSelected(-1);
                _navigator.pop(context);
              },
            ),
          ),
          body: widget.modules[index].body(context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await _navigator.maybePop(),
      child: Navigator(
        key: _navigatorKey,
        onGenerateInitialRoutes: (navigator, initialRoute) {
          return [
            MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(AppLocalizations.of(context).title),
                  ),
                  body: ListView(
                    children: [
                      for (var i = 0; i < widget.modules.length; ++i)
                        ListTile(
                          title: widget.modules[i].title(context),
                          onTap: () {
                            _navigator.push(pageRoute(i));
                            widget.onSelected(i);
                          },
                        )
                    ],
                  ),
                );
              },
            ),
            if (widget.index != -1) pageRoute(widget.index)
          ];
        },
      ),
    );
  }
}
