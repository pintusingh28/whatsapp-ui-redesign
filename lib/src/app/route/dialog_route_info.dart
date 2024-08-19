import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';

import 'route_info.dart';

class DialogRouteInfo<T extends Object?> extends RouteInfo<T> {
  DialogRouteInfo({
    required super.routeName,
    required super.builder,
    super.canNavigate,
    super.paramPatterns,
    super.redirect,
    super.authRequired = true,
    this.barrierDismissible = true,
    this.anchorPoint,
  });

  final bool barrierDismissible;
  final Offset? anchorPoint;

  @override
  Route buildRoute(RouteSettings settings, RouteState state) {
    return _ModalDialogRoute(
      settings: settings,
      barrierDismissible: barrierDismissible,
      anchorPoint: anchorPoint,
      builder: (context) => builder(context, state),
    );
  }
}

class _ModalDialogRoute<T> extends RawDialogRoute<T> {
  _ModalDialogRoute({
    required WidgetBuilder builder,
    super.settings,
    super.anchorPoint,
    super.barrierDismissible,
  }) : super(
          transitionDuration: const Duration(milliseconds: 150),
          traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
          pageBuilder: (context, animation, secondaryAnimation) {
            final result = builder(context);
            return Semantics(
              scopesRoute: true,
              explicitChildNodes: true,
              child: SafeArea(
                minimum: const EdgeInsets.symmetric(vertical: Spacing.large, horizontal: Spacing.normal),
                child: result,
              ),
            );
          },
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            final opacity = CurvedAnimation(
              parent: animation,
              curve: const Interval(0.0, 1.0 / 3.0),
            );

            final scale = CurvedAnimation(
              parent: Tween(begin: 0.5, end: 1.0).animate(animation),
              curve: Curves.ease,
            );

            return FadeTransition(
              opacity: opacity,
              child: ScaleTransition(
                scale: scale,
                child: child,
              ),
            );
          },
        );
}
