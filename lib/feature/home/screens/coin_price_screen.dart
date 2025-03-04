import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_websocket/feature/models/coin_price_model.dart';

class CoinPriceScreen extends ConsumerWidget {
  final List<String> productIds;
  const CoinPriceScreen({super.key, required this.productIds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Coin Price"),
      actions: [
        IconButton(
            onPressed: () {
              ref.read(coinPricemodelProvider(productIds).notifier).reset();
            },
            icon: Icon(Icons.refresh))
      ],
    ));
  }
}
