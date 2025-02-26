import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final coinbaseWebScoketProvider = Provider<CoinbaseWebSocket>((ref) {
  ref.onDispose(() {
    debugPrint("socket disposed");
  });
  ref.onCancel(() {
    debugPrint("socket cancel");
  });
  ref.onAddListener(() {
    debugPrint("socket added");
  });
  ref.onResume(() {
    // debugPrint("socket resume");
  });
  ref.onRemoveListener(() {
    // debugPrint("socket removed");
  });
  return CoinbaseWebSocket();
});

class CoinbaseWebSocket {
  final url = "wss://ws-feed-public.sandbox.exchange.coinbase.com";

  WebSocketChannel connect() {
    return WebSocketChannel.connect(Uri.parse(url));
  }
}
