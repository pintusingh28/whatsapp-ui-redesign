import 'package:flutter/foundation.dart';

enum MainNavigationOption {
  chat,
  story,
  channel,
  call,
  setting;
}

class MainScreenProvider extends ChangeNotifier {
  MainNavigationOption _selectedOption = MainNavigationOption.chat;

  MainNavigationOption get selectedOption => _selectedOption;

  void changeNavigationOption(MainNavigationOption option) {
    if (option == _selectedOption) return;
    _selectedOption = option;
    notifyListeners();
  }
}
