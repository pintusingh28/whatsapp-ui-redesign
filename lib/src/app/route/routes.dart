import 'package:whatsapp_redesign/src/app/route/route_info.dart';
import 'package:whatsapp_redesign/src/presentation/pages/main/main.dart';

import 'material_route_info.dart';
import 'route_generator.dart';

class AppRoutes with AppRouteGenerator {
  const AppRoutes();

  static const defaultInitialRoute = '/';

  @override
  List<RouteInfo> get routes => List<RouteInfo>.unmodifiable(_routes);

  List<RouteInfo> get _routes {
    return List<RouteInfo>.unmodifiable([
      MaterialRouteInfo(
        routeName: '/',
        authRequired: false,
        builder: (context, state) => const MainScreen(),
      ),
    ]);
  }
}
