import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/src/core/core.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
    required this.title,
    this.leadingAction,
    this.trailingAction,
  });

  final String title;
  final Widget? leadingAction;
  final Widget? trailingAction;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _MainHeaderDelegate(
        height: kToolbarHeight + Spacing.normal + kToolbarHeight + context.mediaQueryPadding.top,
        title: title,
        leadingAction: leadingAction,
        trailingAction: trailingAction,
      ),
    );
  }
}

class _MainHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _MainHeaderDelegate({
    required this.height,
    required this.title,
    this.leadingAction,
    this.trailingAction,
  });

  final double height;
  final String title;
  final Widget? leadingAction;
  final Widget? trailingAction;

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final ThemeData(:textTheme, :colorScheme) = context.theme;

    return SafeArea(
      bottom: false,
      minimum: const EdgeInsets.symmetric(horizontal: Spacing.normal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: IconButtonTheme(
                data: IconButtonThemeData(
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.surfaceContainer,
                    foregroundColor: colorScheme.onSurface,
                    padding: const EdgeInsets.all(Spacing.normal),
                  ),
                ),
                child: NavigationToolbar(
                  leading: leadingAction,
                  trailing: trailingAction,
                ),
              ),
            ),
          ),

          SizedBox(
            height: kToolbarHeight,
            child: Text(
              title,
              style: textTheme.headlineLarge ,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_MainHeaderDelegate oldDelegate) => oldDelegate.height != height;
}
