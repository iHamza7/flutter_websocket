import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_websocket/feature/repository/coin_price_repository.dart';

final coinPricemodelProvider =
    AutoDisposeNotifierProviderFamily<CoinPriceModel, AsyncValue, List<String>>(
        CoinPriceModel.new);

class CoinPriceModel
    extends AutoDisposeFamilyNotifier<AsyncValue, List<String>> {
  @override
  AsyncValue build(List<String> arg) {
    final priceStream = ref.watch(coinbasePriceRepositoryProvider(arg));
    return priceStream;
  }

  void reset() {
    ref.invalidate(coinbasePriceRepositoryProvider);
  }
}
