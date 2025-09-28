import 'package:flutter/material.dart';
import 'widgets/auth_wrapper.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyZikrApp());
}

class MyZikrApp extends StatelessWidget {
  const MyZikrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My.Zikr',
      theme: AppTheme.lightTheme,
      home: const AuthWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
