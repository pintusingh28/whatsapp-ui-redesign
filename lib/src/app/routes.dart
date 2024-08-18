import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_redesign/src/presentation/pages/main/main.dart';

class AppRoutes {
  AppRoutes();

  late final GoRouter _router = GoRouter(
    routes: _routes,
  );

  RouterConfig<Object> get routerConfig => _router;

  List<GoRoute> get _routes {
    return List.unmodifiable([
      ShellRoute(
        builder: (context, state, child) => const MainScreen(),
        routes: [],
      ),
    ]);
  }
}
