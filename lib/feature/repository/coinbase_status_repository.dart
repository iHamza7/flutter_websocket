import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_websocket/feature/api/api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final coinbaseStatusRepositoryProvider =
    AutoDisposeStreamProvider<Map<String, dynamic>>((ref) {
  final coinbaseSocket = ref.watch(coinbaseWebScoketProvider);
  final coinbaseStatusRepository = CoinbaseStatusRepository(coinbaseSocket);
  return coinbaseStatusRepository.stream;
});

class CoinbaseStatusRepository {
  final CoinbaseWebSocket _coinbaseWebSocket;

  CoinbaseStatusRepository(this._coinbaseWebSocket) {
    _init();
  }

  WebSocketChannel? _channel;
  final bool _isDispose = false;
  bool _isSubscribed = false;
  final StreamController<Map<String, dynamic>> _streamController =
      StreamController<Map<String, dynamic>>();
  Stream<Map<String, dynamic>> get stream => _streamController.stream;

  void _init() {
    _channel = _coinbaseWebSocket.connect();
    _subscribeToChannel();
    _listen();
  }

  void _subscribeToChannel() {
    if (_isDispose) return;
    final message = jsonEncode({
      "type": "subscribe tqaasmsk",
      "channels": [
        {"name": "status"}
      ]
    });

    _isSubscribed = true;
    _channel?.sink.add(message);
  }

  void _listen() {
    if (_isDispose) return;
    _channel?.stream.listen((data) {
      final jsonData = jsonDecode(data) as Map<String, dynamic>;
      _streamController.add(jsonData);
    }, onDone: () {}, cancelOnError: true);
  }
}
