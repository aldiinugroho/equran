import 'package:equran/screen/detail/main.dart';
import 'package:equran/screen/main/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter mainRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
    ),
    GoRoute(
      path: '/detail',
      builder: (BuildContext context, GoRouterState state) {
        final dynamic data = state.extra!;
        String detailId = data['detailId'] ?? '';
        return DetailScreen(
          detailId: detailId,
        );
      },
    ),
  ],
);
