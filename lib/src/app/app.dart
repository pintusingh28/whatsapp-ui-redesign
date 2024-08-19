import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whatsapp_redesign/src/presentation/localization/l10n.dart';

import 'route/routes.dart';
import 'theme.dart';

class WhatsappRedesignApp extends StatefulWidget {
  const WhatsappRedesignApp({super.key});

  static WhatsappRedesignAppState of(BuildContext context) {
    final state = context.findAncestorStateOfType<WhatsappRedesignAppState>();
    assert(state != null, 'No WhatsappRedesignApp found in context!');
    return state!;
  }

  @override
  State<WhatsappRedesignApp> createState() => WhatsappRedesignAppState();
}

class WhatsappRedesignAppState extends State<WhatsappRedesignApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final RouteObserver routeObserver = RouteObserver();
  late WhatsappRedesignTheme _theme;
  late AppRoutes _appRoutes;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = WhatsappRedesignTheme(context);
    _appRoutes = const AppRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'whatsapp_redesign',
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      navigatorObservers: [routeObserver],
      theme: _theme.lightTheme,
      darkTheme: _theme.darkTheme,
      onGenerateRoute: _appRoutes.onGenerateRoute,
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
