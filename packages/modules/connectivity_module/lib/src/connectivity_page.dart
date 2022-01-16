import 'package:flutter/material.dart';
import 'package:modular_service/modular_service.dart';
import 'package:provider/provider.dart';

import 'l10n/connectivity_localizations.dart';
import 'connectivity_model.dart';
import 'connectivity_service.dart';

class ConnectivityPage extends StatefulWidget {
  const ConnectivityPage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(ConnectivityLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConnectivityModel(getService<ConnectivityService>()),
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
    return Center(
      child: model.state == null
          ? const CircularProgressIndicator()
          : Text(model.state!.localize(context)),
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
