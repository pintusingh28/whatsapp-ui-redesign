import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';
import 'package:whatsapp_redesign/src/presentation/resources/icons.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    required this.onSearch,
    this.hintText,
  });

  final TextEditingController controller;
  final String? hintText;
  final ValueSetter<String> onSearch;

  void _onSearch([String? value]) {
    final searchText = (value ?? controller.text).trim();
    onSearch(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textInputAction: TextInputAction.search,
      onSubmitted: _onSearch,
      decoration: InputDecoration(
        hintText: hintText ?? 'Search',
        prefixIcon: IconButton(
          padding: const EdgeInsets.all(Spacing.normal),
          onPressed: _onSearch,
          icon: const SvgIcon(SvgIcons.search),
        ),
      ),
    );
  }
}
