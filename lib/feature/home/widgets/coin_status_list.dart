import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_websocket/feature/repository/coinbase_status_repository.dart';

class CoinStatusList extends ConsumerWidget {
  const CoinStatusList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(coinbaseStatusRepositoryProvider);
    return asyncValue.when(
        data: (data) {
          final coins = data["products"] as List<dynamic>;
          return ListView.builder(
            itemBuilder: (context, index) {
              final coinData = coins[index];
              return ListTile(
                title: Text(coinData["id"]),
                subtitle: Text(coinData["status"]),
              );
            },
            itemCount: coins.length,
          );
        },
        error: (e, s) => Center(child: Text(e.toString())),
        loading: () => CircularProgressIndicator());
  }
}
