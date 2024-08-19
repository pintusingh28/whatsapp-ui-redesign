import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/chat_screen_provider.dart';
import 'view/chat_view.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatScreenProvider(),
      child: const ChatView(),
    );
  }
}
