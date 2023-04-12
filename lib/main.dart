import 'package:flutter/material.dart';

import 'UI/chat_page.dart';

void main() {
  runApp(const MyApp());
}

MaterialColor themeColor = MaterialColor(0xFF795548, <int, Color>{
  50: Color(0xFF795548),
  100: Color(0xFF795548),
  200: Color(0xFF795548),
  300: Color(0xFF795548),
  400: Color(0xFF795548),
  500: Color(0xFF795548),
  600: Color(0xFF795548),
  700: Color(0xFF795548),
  800: Color(0xFF795548),
  900: Color(0xFF795548),
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: themeColor,
      ),
      home: const ChatPage(),
    );
  }
}
