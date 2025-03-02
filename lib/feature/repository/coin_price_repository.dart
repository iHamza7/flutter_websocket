import 'dart:async';
import 'dart:convert';

import 'package:flutter_websocket/feature/api/api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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
    if (_isDispose) return;
    final message = jsonEncode({
      "type": "subscribe",
      "product_ids": _productIds,
      "channels": ["ticker"]
    });

    _isSubscribed = true;
    _channel?.sink.add(message);
  }

  void _unSubscribeToChannel() {
    if (_isDispose) return;
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
