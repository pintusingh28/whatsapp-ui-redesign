import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:whatsapp_redesign/src/presentation/localization/l10n.dart';
import 'package:whatsapp_redesign/src/presentation/pages/main/main.dart';

import 'theme.dart';
import 'routes.dart';

class WhatsappRedesignedApp extends StatefulWidget {
  const WhatsappRedesignedApp({super.key});

  @override
  State<WhatsappRedesignedApp> createState() => _WhatsappRedesignedAppState();
}

class _WhatsappRedesignedAppState extends State<WhatsappRedesignedApp> {
  late WhatsappRedesignTheme _theme;
  late AppRoutes _appRoutes;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = WhatsappRedesignTheme(context);
    _appRoutes = AppRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: _theme.lightTheme,
      darkTheme: _theme.darkTheme,
      routerConfig: _appRoutes.routerConfig,
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
