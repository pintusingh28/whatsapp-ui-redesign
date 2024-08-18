import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WhatsappRedesignTheme with Diagnosticable {
  const WhatsappRedesignTheme(this.context);

  final BuildContext context;

  ThemeData get lightTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF12AE5E),
      onPrimary: Color(0xFF000000),
      secondary: Color(0xFF12AE5E),
      onSecondary: Color(0xFF000000),
      error: Color(0xFFFF3508),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFFBFCFC),
      surfaceContainer: Color(0xFFF8FAF9),
      surfaceContainerHigh: Color(0xFFF1F5F3),
      surfaceContainerHighest: Color(0xFFEAF0ED),
      onSurface: Color(0xFF040404),
      onSurfaceVariant: Color(0xFF6C6E6D),
    );
    return ThemeData(
      colorScheme: colorScheme,
    );
  }

  ThemeData get darkTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF12AE5E),
      onPrimary: Color(0xFF000000),
      secondary: Color(0xFF12AE5E),
      onSecondary: Color(0xFF000000),
      error: Color(0xFFFF3508),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFF212121),
      surfaceContainerLowest: Color(0xFF000000),
      surfaceContainerLow: Color(0xFF090909),
      surfaceContainer: Color(0xFF121212),
      surfaceContainerHigh: Color(0xFF242424),
      surfaceContainerHighest: Color(0xFF363636),
      onSurface: Color(0xFF040404),
      onSurfaceVariant: Color(0xFF6C6E6D),
    );
    return ThemeData(
      colorScheme: colorScheme,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BuildContext>('context', context));
  }
}
