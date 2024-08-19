import 'package:flutter/material.dart';

import 'route_info.dart';

abstract mixin class AppRouteGenerator {
  List<RouteInfo> get routes;

  Map<String, String> _parseParams(Uri uri, String pathPattern) {
    assert(pathPattern.startsWith('/'));
    final pathParams = <String, String>{};

    final pathSegments = pathPattern.substring(1).split('/');
    final routeNameParts = uri.pathSegments;

    for (int index = 0; index < pathSegments.length; index++) {
      final part = pathSegments[index];
      if (RouteInfo.paramNamePattern.hasMatch(part)) {
        pathParams[part.substring(1)] = routeNameParts[index];
      }
    }
    return pathParams;
  }

  RouteState _parseRouteState(RouteInfo routeInfo, RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '');

    return RouteState(
      uri: uri,
      arguments: settings.arguments,
      pathParams: _parseParams(uri, routeInfo.routeName),
    );
  }

  ({RouteInfo routeInfo, RouteSettings settings})? getRouteInfo(RouteSettings settings) {
    final Uri uri = Uri.parse(settings.name ?? '');

    for (final element in routes) {
      if (element.hasMatch(uri.path)) {
        RouteState state = _parseRouteState(element, settings);
        final redirectSettings = element.redirect?.call(state);
        if (redirectSettings != null) {
          return getRouteInfo(redirectSettings);
        }
        return (
          routeInfo: element,
          settings: settings,
        );
      }
    }
    return null;
  }

  Route? generateRoute(RouteInfo routeInfo, RouteSettings settings) {
    RouteState state = _parseRouteState(routeInfo, settings);

    final canNavigate = routeInfo.canNavigate?.call(state) ?? true;
    if (canNavigate) {
      return routeInfo.buildRoute(settings, state);
    }

    return null;
  }

  Route? onGenerateRoute(RouteSettings settings) {
    final result = getRouteInfo(settings);
    if (result == null) return null;

    return generateRoute(result.routeInfo, result.settings);
  }
}
