import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ui_components/ui_components.dart';
import 'package:whatsapp_redesign/src/core/extensions/build_context_extensions.dart';
import 'package:whatsapp_redesign/src/presentation/components/main_header.dart';
import 'package:whatsapp_redesign/src/presentation/components/search_field.dart';
import 'package:whatsapp_redesign/src/presentation/components/selection_chip.dart';
import 'package:whatsapp_redesign/src/presentation/localization/l10n.dart';
import 'package:whatsapp_redesign/src/presentation/pages/chat/logic/chat_screen_provider.dart';
import 'package:whatsapp_redesign/src/presentation/resources/resources.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
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
    final l10n = context.l10n;

    return Scaffold(
      primary: false,
      body: CustomScrollView(
        slivers: [
          MainHeader(
            title: Text(l10n.chatsScreenTitle),
            leadingAction: IconButton(
              onPressed: () {},
              icon: const SvgIcon(SvgIcons.menu),
            ),
            trailingAction: IconButton(
              onPressed: () {},
              icon: const SvgIcon(SvgIcons.camera),
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
          const SliverToBoxAdapter(
            child: _ChatListTypes(),
          ),
          const SliverGap(Spacing.normal),
          SliverGap(Spacing.normal + context.mediaQueryPadding.bottom),
        ],
      ),
    );
  }
}

class _ChatListTypes extends StatelessWidget {
  const _ChatListTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SafeArea(
        top: false,
        bottom: false,
        minimum: EdgeInsets.symmetric(horizontal: Spacing.normal),
        child: OverflowBar(
          spacing: Spacing.small,
          children: [
            _ChatListTypeChip(label: 'All', type: ChatListType.all),
            _ChatListTypeChip(label: 'Unread', type: ChatListType.unread),
            _ChatListTypeChip(label: 'Favorites', type: ChatListType.favorites),
            _ChatListTypeChip(label: 'Groups', type: ChatListType.groups),
          ],
        ),
      ),
    );
  }
}

class _ChatListTypeChip extends StatelessWidget {
  const _ChatListTypeChip({
    required this.label,
    required this.type,
  });

  final String label;
  final ChatListType type;

  @override
  Widget build(BuildContext context) {
    final bool selected = context.select<ChatScreenProvider, bool>(
      (value) => value.selectedType == type,
    );

    return SelectionChip(
      selected: selected,
      onSelected: (value) => context.read<ChatScreenProvider>().changeListType(type),
      label: Text(label),
    );
  }
}
