import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const DeshExplorerApp());
}

class DeshExplorerApp extends StatelessWidget {
  const DeshExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeshExplorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter', // Optional, standard modern sans-serif
        scaffoldBackgroundColor: const Color(0xFF18D2D1),
      ),
      home: const LoginScreen(),
    );
  }
}