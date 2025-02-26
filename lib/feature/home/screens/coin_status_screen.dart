import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_websocket/feature/home/widgets/coin_status_list.dart';
import 'package:flutter_websocket/feature/home/widgets/refresh_button.dart';

class CoinStatusScreen extends ConsumerStatefulWidget {
  const CoinStatusScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CoinStatusScreenState();
}

class _CoinStatusScreenState extends ConsumerState<CoinStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coin Status"),
        actions: [RefreshButton()],
      ),
      body: CoinStatusList(),
    );
  }
}
