import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_websocket/feature/models/coin_status_model.dart';

class RefreshButton extends ConsumerWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          ref.read(coinStatusModelProvider.notifier).reset();
        },
        icon: Icon(Icons.refresh));
  }
}
