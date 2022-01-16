import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:plus_core/plus_core.dart';

const kLeftPaneWidth = 245.0;

class LandscapeLayout extends StatefulWidget {
  const LandscapeLayout({
    Key? key,
    required this.index,
    required this.modules,
    required this.onSelected,
  }) : super(key: key);

  final int index;
  final List<PlusModule> modules;
  final ValueChanged<int> onSelected;

  @override
  State<LandscapeLayout> createState() => _LandscapeLayoutState();
}

class _LandscapeLayoutState extends State<LandscapeLayout> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _LandscapeContainer(
            left: AppBar(
              centerTitle: false,
              title: Text(AppLocalizations.of(context).title),
            ),
            right: AppBar(
              centerTitle: false,
              title: widget.modules[_index].title(context),
            ),
          ),
          Expanded(
            child: _LandscapeContainer(
              left: ListView(
                children: [
                  for (var i = 0; i < widget.modules.length; ++i)
                    ListTile(
                      title: widget.modules[i].title(context),
                      selected: i == _index,
                      onTap: () {
                        widget.onSelected(i);
                        setState(() => _index = i);
                      },
                    )
                ],
              ),
              right: widget.modules[_index].body(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _LandscapeContainer extends StatelessWidget {
  const _LandscapeContainer({
    Key? key,
    required this.left,
    required this.right,
  }) : super(key: key);

  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: kLeftPaneWidth,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 1,
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: left,
        ),
        Expanded(child: right),
      ],
    );
  }
}
