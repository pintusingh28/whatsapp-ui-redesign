import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';

class SelectionChip extends StatelessWidget {
  const SelectionChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final Widget label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor =
        selected ? theme.colorScheme.primaryContainer : theme.colorScheme.surfaceContainerHigh;
    final foregroundColor = selected ? theme.colorScheme.onPrimaryContainer : theme.colorScheme.onSurfaceVariant;
    const effectiveShape = StadiumBorder();

    final effectiveTextStyle =
        DefaultTextStyle.of(context).style.merge(theme.textTheme.bodyMedium).copyWith(color: foregroundColor);

    return Material(
      color: backgroundColor,
      shape: effectiveShape,
      textStyle: effectiveTextStyle,
      child: InkWell(
        onTap: () => onSelected(!selected),
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Spacing.small, horizontal: Spacing.normal),
          child: label,
        ),
      ),
    );
  }
}
