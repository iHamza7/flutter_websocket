import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_websocket/feature/home/screens/coin_price_screen.dart';
import 'package:flutter_websocket/feature/home/screens/coin_status_screen.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return CoinStatusScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'price/:productId',
            builder: (context, state) {
              final productId = state.pathParameters['productId'] ?? '';
              return CoinPriceScreen(
                productIds: [productId],
              );
            },
          )
        ],
      )
    ],
  );
});
