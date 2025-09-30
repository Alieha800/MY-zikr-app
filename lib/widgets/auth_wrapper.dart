import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/welcome_screen.dart';
import '../widgets/loading_widget.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print('AuthWrapper - Connection state: ${snapshot.connectionState}');
        print('AuthWrapper - Has data: ${snapshot.hasData}');
        print('AuthWrapper - User: ${snapshot.data?.email}');

        // Show loading while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: LoadingWidget(
              message: 'Loading...',
            ),
          );
        }

        // Show welcome screen if user is authenticated
        if (snapshot.hasData && snapshot.data != null) {
          return const WelcomeScreen();
        }

        // Show signup screen first (as requested by user)
        return const SignupScreen();
      },
    );
  }
}
