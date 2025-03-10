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
        title: Text("Coin Price hamz"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(coinPricemodelProvider(productIds).notifier).reset();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        final data = ref.watch(coinPricemodelProvider(productIds));
        return data.when(
            data: (rawData) {
              final price = rawData['price'] ?? '0';

              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rawData['product_id'] ?? '-'),
                    Text(price == '0' ? '-' : price),
                    Text(rawData['time'] ?? '-'),
                  ],
                ),
              );
            },
            error: (e, s) => Center(child: Text(e.toString())),
            loading: () => Center(child: CircularProgressIndicator()));
      }),
    );
  }
}
