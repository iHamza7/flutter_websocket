import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_websocket/feature/repository/coinbase_status_repository.dart';
import 'package:flutter_websocket/feature/state/coin_status_state.dart';

final oinStatusModelProvider =
    AutoDisposeNotifierProvider<CoinStatusModel, CoinStatusState>(
        CoinStatusModel.new);

class CoinStatusModel extends AutoDisposeNotifier<CoinStatusState> {
  @override
  CoinStatusState build() {
    final data = ref.watch(coinbaseStatusRepositoryProvider);

    return CoinStatusState(data: data);
  }
}
