import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  MediaQueryData get mediaQuery {
    debugCheckHasMediaQuery(this);
    return MediaQuery.of(this);
  }

  EdgeInsets get mediaQueryPadding {
    debugCheckHasMediaQuery(this);
    return MediaQuery.paddingOf(this);
  }

  EdgeInsets get mediaQueryViewPadding {
    debugCheckHasMediaQuery(this);
    return MediaQuery.viewPaddingOf(this);
  }

  EdgeInsets get mediaQueryInsets {
    debugCheckHasMediaQuery(this);
    return MediaQuery.viewInsetsOf(this);
  }

  TextScaler get textScaler {
    debugCheckHasMediaQuery(this);
    return MediaQuery.textScalerOf(this);
  }

  Orientation get orientation {
    debugCheckHasMediaQuery(this);
    return MediaQuery.orientationOf(this);
  }

  Size get mediaQuerySize {
    debugCheckHasMediaQuery(this);
    return MediaQuery.sizeOf(this);
  }

  double get height {
    debugCheckHasMediaQuery(this);
    return MediaQuery.sizeOf(this).height;
  }

  double get width {
    debugCheckHasMediaQuery(this);
    return MediaQuery.sizeOf(this).width;
  }

  TextDirection get textDirection {
    debugCheckHasDirectionality(this);
    return Directionality.of(this);
  }

  NavigatorState get navigator => Navigator.of(this);

  Locale get locale => Localizations.localeOf(this);

  Object? get args => ModalRoute.of(this)?.settings.arguments;

  T getArguments<T extends Object?>() {
    assert(args is T);
    return args as T;
  }
}
