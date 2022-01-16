import 'package:flutter/material.dart';
import 'package:modular_interface/modular_interface.dart';
import 'package:provider/provider.dart';

import 'l10n/network_localizations.dart';
import 'network_model.dart';
import 'network_service.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(NetworkLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NetworkModel(getService<NetworkService>()),
      child: const NetworkPage(),
    );
  }

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  void initState() {
    super.initState();
    context.read<NetworkModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NetworkModel>();
    return Center(
      child: model.state == null
          ? const CircularProgressIndicator()
          : Text(model.state!.localize(context)),
    );
  }
}

extension NetworkStateL10n on NetworkState {
  String localize(BuildContext context) {
    final l10n = NetworkLocalizations.of(context);
    switch (this) {
      case NetworkState.none:
        return l10n.offline;
      default:
        return l10n.online;
    }
  }
}
