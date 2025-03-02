import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_websocket/feature/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'coin_price_repository.g.dart';

@riverpod
Stream coinbasePriceRepository(Ref ref, List<String> productIds) {
  final coinbaseWebSocket = ref.watch(coinbaseWebScoketProvider);
  final coinbasePriceRepository =
      CoinbasePriceRepository(coinbaseWebSocket, productIds);

  ref.onDispose(() {
    coinbasePriceRepository._unSubscribeToPrice();
    coinbasePriceRepository.dispose();
    ref.invalidate(coinbaseWebScoketProvider);
    // debugPrint("repository disposed");
  });
  return coinbasePriceRepository.stream;
}

class CoinbasePriceRepository {
  final CoinbaseWebSocket _coinbaseWebSocket;
  final List<String> _productIds;

  CoinbasePriceRepository(this._coinbaseWebSocket, this._productIds) {
    _init();
  }

  WebSocketChannel? _channel;
  bool _isDispose = false;
  bool _isSubscribed = false;
  final StreamController<Map<String, dynamic>> _streamController =
      StreamController<Map<String, dynamic>>();
  Stream<Map<String, dynamic>> get stream => _streamController.stream;

  void _init() {
    _channel = _coinbaseWebSocket.connect();
    _subscribeToPrice();
    _listen();
  }

  void _subscribeToPrice() {
    if (_isDispose || _isSubscribed) return;
    final message = jsonEncode({
      "type": "subscribe",
      "product_ids": _productIds,
      "channels": ["ticker"]
    });

    _isSubscribed = true;
    _channel?.sink.add(message);
  }

  void _unSubscribeToPrice() {
    if (_isDispose || !_isSubscribed) return;
    final message = jsonEncode({
      "type": "unsubscribe",
      "channels": ["ticker"]
    });

    _isSubscribed = false;
    _channel?.sink.add(message);
  }

  void _listen() {
    if (_isDispose) return;
    _channel?.stream.listen(
        (data) {
          final jsonData = jsonDecode(data) as Map<String, dynamic>;
          _streamController.add(jsonData);
        },
        onDone: () {},
        onError: (e) {
          _reConnect();
        });
  }

  void _reConnect() {
    if (_isDispose) return;

    Future.delayed(Duration(seconds: 3), () {
      _init();
    });
  }

  void dispose() {
    _isDispose = true;
    _channel?.sink.close();
    _streamController.close();
  }
}
