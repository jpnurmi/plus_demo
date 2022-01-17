import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:plus_core/plus_core.dart';
import 'package:provider/provider.dart';

import 'l10n/connectivity_localizations.dart';
import 'connectivity_model.dart';

class ConnectivityPage extends StatefulWidget {
  const ConnectivityPage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(ConnectivityLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConnectivityModel(getPlugin<Connectivity>()),
      child: const ConnectivityPage(),
    );
  }

  @override
  State<ConnectivityPage> createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  @override
  void initState() {
    super.initState();
    context.read<ConnectivityModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ConnectivityModel>();
    final l10n = ConnectivityLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(model.state?.localize(context) ?? ''),
              subtitle: Text(l10n.state),
            ),
          ),
        ],
      ),
    );
  }
}

extension ConnectivityStateL10n on ConnectivityState {
  String localize(BuildContext context) {
    final l10n = ConnectivityLocalizations.of(context);
    switch (this) {
      case ConnectivityState.none:
        return l10n.offline;
      default:
        return l10n.online;
    }
  }
}
