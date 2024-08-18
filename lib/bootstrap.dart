import 'dart:async';

import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef AsyncAppBuilder = FutureOr<Widget> Function();

Future<void> bootstrap(
  AsyncAppBuilder builder,
) async {
  return runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      final app = await builder();
      runApp(
        AdaptiveLayout.fromView(child: app),
      );
    },
    (error, stack) {
      debugPrint(error.toString());
      debugPrint(stack.toString());
    },
  );
}
