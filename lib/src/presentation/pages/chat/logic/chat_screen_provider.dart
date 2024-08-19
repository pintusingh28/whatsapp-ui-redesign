import 'package:flutter/foundation.dart';

enum ChatListType {
  all,
  unread,
  favorites,
  groups;
}

class ChatScreenProvider extends ChangeNotifier {
  ChatListType _selectedType = ChatListType.all;

  ChatListType get selectedType => _selectedType;

  void changeListType(ChatListType type) {
    if (type == _selectedType) return;
    _selectedType = type;
    notifyListeners();
  }
}
