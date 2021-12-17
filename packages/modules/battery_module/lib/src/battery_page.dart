import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/battery_localizations.dart';
import 'battery_model.dart';
import 'battery_service.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({Key? key}) : super(key: key);

  static Widget title(BuildContext context) {
    return Text(BatteryLocalizations.of(context).title);
  }

  static Widget body(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BatteryModel(context.read<BatteryService>()),
      child: const BatteryPage(),
    );
  }

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  @override
  void initState() {
    super.initState();
    context.read<BatteryModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<BatteryModel>();
    return Center(
      child: model.state == null
          ? const CircularProgressIndicator()
          : Text(model.state!.localize(context)),
    );
  }
}

extension BatteryStateL10n on BatteryState {
  String localize(BuildContext context) {
    final l10n = BatteryLocalizations.of(context);
    switch (this) {
      case BatteryState.charging:
        return l10n.charging;
      case BatteryState.discharging:
        return l10n.discharging;
      case BatteryState.full:
        return l10n.full;
      case BatteryState.unknown:
        return l10n.unknown;
    }
  }
}
