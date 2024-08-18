import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/main_screen_provider.dart';
import 'view/main_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainScreenProvider(),
      child: const MainView(),
    );
  }
}
