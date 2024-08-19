import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_components/ui_components.dart';
import 'package:whatsapp_redesign/src/core/extensions/build_context_extensions.dart';
import 'package:whatsapp_redesign/src/presentation/components/main_header.dart';
import 'package:whatsapp_redesign/src/presentation/components/search_field.dart';
import 'package:whatsapp_redesign/src/presentation/localization/l10n.dart';
import 'package:whatsapp_redesign/src/presentation/resources/resources.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme) = context.theme;
    final l10n = context.l10n;

    return Scaffold(
      primary: false,
      body: CustomScrollView(
        slivers: [
          MainHeader(
            title: Text(l10n.settingsScreenTitle),
            leadingAction: IconButton(
              onPressed: () {},
              icon: const SvgIcon(SvgIcons.qrScan),
            ),
          ),
          SliverSafeArea(
            top: false,
            bottom: false,
            minimum: const EdgeInsets.symmetric(horizontal: Spacing.normal),
            sliver: SliverToBoxAdapter(
              child: SearchField(
                controller: _searchController,
                onSearch: (value) {},
              ),
            ),
          ),
          const SliverGap(Spacing.normal),
          SliverSafeArea(
            top: false,
            bottom: false,
            minimum: const EdgeInsets.symmetric(horizontal: Spacing.normal),
            sliver: SliverToBoxAdapter(
              child: ListTile(
                tileColor: colorScheme.surfaceContainer,
                shape: Shapes.full,
                contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.normal, vertical: Spacing.small),
                onTap: () {},
                leading: const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1641288883869-c463bc6c2a58?q=50&w=640&h=640&fit=crop',
                  ),
                ),
                title: const Text('Alexander Suprun'),
                trailing: const SvgIcon(SvgIcons.arrowRight),
              ),
            ),
          ),
          const SliverGap(Spacing.normal),
          SliverSafeArea(
            top: false,
            bottom: false,
            minimum: const EdgeInsets.symmetric(horizontal: Spacing.normal),
            sliver: SliverToBoxAdapter(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    _SettingOptionTile(
                      icon: SvgIcons.favourites,
                      label: l10n.favoritesSettingLabel,
                      onPressed: () {},
                    ),
                    _SettingOptionTile(
                      icon: SvgIcons.starred,
                      label: l10n.starredMessagesSettingLabel,
                      onPressed: () {},
                    ),
                    _SettingOptionTile(
                      icon: SvgIcons.linkedDevices,
                      label: l10n.linkedDevicesSettingLabel,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverGap(Spacing.medium),
          SliverSafeArea(
            top: false,
            bottom: false,
            minimum: const EdgeInsets.symmetric(horizontal: Spacing.normal),
            sliver: SliverToBoxAdapter(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    _SettingOptionTile(
                      icon: SvgIcons.appearance,
                      label: l10n.appearanceSettingLabel,
                      onPressed: () {},
                    ),
                    _SettingOptionTile(
                      icon: SvgIcons.account,
                      label: l10n.accountSettingLabel,
                      onPressed: () {},
                    ),
                    _SettingOptionTile(
                      icon: SvgIcons.privacy,
                      label: l10n.privacySettingLabel,
                      onPressed: () {},
                    ),
                    _SettingOptionTile(
                      icon: SvgIcons.chats,
                      label: l10n.chatSettingLabel,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverGap(Spacing.normal + context.mediaQueryPadding.bottom),
        ],
      ),
    );
  }
}

class _SettingOptionTile extends StatelessWidget {
  const _SettingOptionTile({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final String icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.normal),
      onTap: onPressed,
      iconColor: colorScheme.onSurface,
      leading: SvgIcon(icon),
      title: Text(label),
      trailing: const SvgIcon(SvgIcons.arrowRight),
    );
  }
}
