import 'package:flutter/material.dart';
import '../services/local_auth_service.dart';
import '../screens/auth/login_screen.dart';
import '../screens/welcome_screen.dart';
import '../widgets/loading_widget.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final LocalAuthService _authService = LocalAuthService();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeAuth();
  }

  Future<void> _initializeAuth() async {
    await _authService.initialize();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: LoadingWidget(
          message: 'Loading...',
        ),
      );
    }

    if (_authService.isSignedIn) {
      return const WelcomeScreen();
    }

    return const LoginScreen();
  }
}
