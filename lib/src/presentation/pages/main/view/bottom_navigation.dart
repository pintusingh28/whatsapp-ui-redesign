part of 'main_view.dart';

class _NavigationBar extends StatelessWidget {
  const _NavigationBar();

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme) = Theme.of(context);
    final l10n = context.l10n;
    final padding = calculateSafeAreaPadding(
          context: context,
          maintainBottomViewPadding: true,
          minimum: const EdgeInsets.symmetric(horizontal: Spacing.normal),
        ) +
        const EdgeInsets.symmetric(vertical: Spacing.small);

    return Padding(
      padding: padding,
      child: Center(
        heightFactor: 1.0,
        child: Material(
          color: colorScheme.surfaceContainer,
          shape: Shapes.full,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: _NavigationIcons(
                  icon: NavigationIcons.chats,
                  option: MainNavigationOption.chat,
                  label: l10n.chatsTabLabel,
                ),
              ),
              Flexible(
                child: _NavigationIcons(
                  icon: NavigationIcons.stories,
                  option: MainNavigationOption.story,
                  label: l10n.storiesTabLabel,
                ),
              ),
              Flexible(
                child: _NavigationIcons(
                  icon: NavigationIcons.channels,
                  option: MainNavigationOption.channel,
                  label: l10n.channelsTabLabel,
                ),
              ),
              Flexible(
                child: _NavigationIcons(
                  icon: NavigationIcons.calls,
                  option: MainNavigationOption.call,
                  label: l10n.callsTabLabel,
                ),
              ),
              Flexible(
                child: _NavigationIcons(
                  icon: NavigationIcons.settings,
                  option: MainNavigationOption.setting,
                  label: l10n.settingsTabLabel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationIcons extends StatelessWidget {
  const _NavigationIcons({
    required this.icon,
    required this.option,
    required this.label,
  });

  final String icon;
  final MainNavigationOption option;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme) = Theme.of(context);
    final bool selected = context.select<MainScreenProvider, bool>(
      (value) => value.selectedOption == option,
    );

    final Color backgroundColor = selected ? colorScheme.primary.withOpacity(0.1) : Colors.transparent;
    final Color foregroundColor = selected ? colorScheme.primary : colorScheme.onSurfaceVariant;

    return InkResponse(
      radius: 24,
      borderRadius: ShapeBorderRadius.extraLarge,
      splashColor: colorScheme.primary.withOpacity(0.1),
      highlightColor: colorScheme.primary.withOpacity(0.1),
      onTap: () => context.read<MainScreenProvider>().changeNavigationOption(option),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.small),
        child: Material(
          type: MaterialType.circle,
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          child: Tooltip(
            message: label,
            decoration: ShapeDecoration(shape: Shapes.full, color: colorScheme.surfaceContainerHighest),
            textStyle: TextStyle(color: colorScheme.onSurfaceVariant),
            child: SizedBox.square(
              dimension: kMinInteractiveDimension,
              child: SvgIcon(icon, color: foregroundColor),
            ),
          ),
        ),
      ),
    );
  }
}
