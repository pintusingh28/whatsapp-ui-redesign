import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WhatsappRedesignTheme with Diagnosticable {
  const WhatsappRedesignTheme(this.context);

  final BuildContext context;

  static const String defaultFontFamily = 'Inter';

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
      onSurface: Color(0xFF111111),
      onSurfaceVariant: Color(0xFF404040),
    );
    return _getThemeData(colorScheme);
  }

  ThemeData get darkTheme {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
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
      onSurface: Color(0xFFF9F9F9),
      onSurfaceVariant: Color(0xFF999999),
    );
    return _getThemeData(colorScheme);
  }

  ThemeData _getThemeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: defaultFontFamily,
      shadowColor: colorScheme.shadow,
      hintColor: colorScheme.onSurfaceVariant,
      disabledColor: colorScheme.onSurface.withAlpha(50),
      canvasColor: colorScheme.surface,
      cardColor: colorScheme.surfaceContainer,
      splashFactory: NoSplash.splashFactory,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      textTheme: _textTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
    );
  }

  TextTheme _textTheme(ColorScheme colorScheme) {
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w700, letterSpacing: -0.25, height: 1.2),
      displayMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, letterSpacing: 0.0, height: 1.2),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, letterSpacing: 0.0, height: 1.2),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: 0.0, height: 1.2),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: 0.0, height: 1.2),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.0, height: 1.2),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.0, height: 1.2),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15, height: 1.2),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, height: 1.2),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, height: 1.2),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.2),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.2),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.5),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.25, height: 1.5),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, height: 1.5),
    );
  }

  CardTheme _cardTheme(ColorScheme colorScheme) {
    return CardTheme(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: colorScheme.surfaceContainer,
      shape: Shapes.normal,
    );
  }

  InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
    final border = MaterialStateOutlineInputBorder.resolveWith((states) {
      const defaultBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Spacing.xxLarge)),
        borderSide: BorderSide.none,
      );

      if (states.contains(WidgetState.error)) {
        if (states.contains(WidgetState.hovered)) {
          return defaultBorder.copyWith(
            borderSide: BorderSide(color: colorScheme.errorContainer, width: 2.0),
          );
        }
        if (states.contains(WidgetState.focused)) {
          return defaultBorder.copyWith(
            borderSide: BorderSide(color: colorScheme.error, width: 2.0),
          );
        }
        return defaultBorder.copyWith(
          borderSide: BorderSide(color: colorScheme.error),
        );
      }
      if (states.contains(WidgetState.hovered)) {
        return defaultBorder.copyWith(
          borderSide: BorderSide(color: colorScheme.primaryContainer, width: 2.0),
        );
      }
      if (states.contains(WidgetState.focused)) {
        return defaultBorder.copyWith(
          borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
        );
      }

      return defaultBorder;
    });

    final iconColor = WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.error)) return colorScheme.error;
      if (states.contains(WidgetState.focused)) return colorScheme.primary;
      return colorScheme.onSurfaceVariant;
    });

    final fillColor = WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return colorScheme.onSurface.withOpacity(0.1);
      }
      return colorScheme.surfaceContainer;
    });

    return InputDecorationTheme(
      contentPadding: const EdgeInsets.all(Spacing.normal),
      hintStyle: const TextStyle(fontWeight: FontWeight.w500),
      border: border,
      errorMaxLines: 3,
      helperMaxLines: 3,
      suffixIconColor: iconColor,
      prefixIconColor: iconColor,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: fillColor,
      filled: true,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BuildContext>('context', context));
  }
}
