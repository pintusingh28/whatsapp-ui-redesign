import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui_components/ui_components.dart';
import 'package:whatsapp_redesign/src/core/extensions/build_context_extensions.dart';
import 'package:whatsapp_redesign/src/presentation/localization/l10n.dart';
import 'package:whatsapp_redesign/src/presentation/pages/settings/settings.dart';
import 'package:whatsapp_redesign/src/presentation/resources/resources.dart';

import '../logic/main_screen_provider.dart';

part 'bottom_navigation.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final backgroundColorBrightness = ThemeData.estimateBrightnessForColor(colorScheme.surface);
    final foregroundColorBrightness = ThemeData.estimateBrightnessForColor(colorScheme.onSurface);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: backgroundColorBrightness,
        statusBarIconBrightness: foregroundColorBrightness,
        systemNavigationBarIconBrightness: foregroundColorBrightness,
      ),
      child: const Scaffold(
        extendBody: true,
        bottomNavigationBar: _NavigationBar(),
        body: _MainViewContent(),
      ),
    );
  }
}

class _MainViewContent extends StatelessWidget {
  const _MainViewContent();

  @override
  Widget build(BuildContext context) {
    final selectedOption = context.select<MainScreenProvider, MainNavigationOption>(
      (value) => value.selectedOption,
    );

    final child = switch (selectedOption) {
      MainNavigationOption.chat => const Material(key: ValueKey(MainNavigationOption.chat)),
      MainNavigationOption.story => const Material(key: ValueKey(MainNavigationOption.story)),
      MainNavigationOption.channel => const Material(key: ValueKey(MainNavigationOption.channel)),
      MainNavigationOption.call => const Material(key: ValueKey(MainNavigationOption.call)),
      MainNavigationOption.setting => const SettingsScreen(key: ValueKey(MainNavigationOption.setting)),
    };

    return PageTransitionSwitcher(
      reverse: selectedOption == MainNavigationOption.chat,
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) => SharedAxisTransition(
        animation: primaryAnimation,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.vertical,
        fillColor: Colors.transparent,
        child: child,
      ),
      child: child,
    );
  }
}
