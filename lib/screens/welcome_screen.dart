import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/option_card.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Set<String> selectedOptions = {};
  final AuthService _authService = AuthService();

  String get userName {
    final user = FirebaseAuth.instance.currentUser;
    return user?.displayName ?? user?.email?.split('@')[0] ?? "User";
  }

  final List<String> selectedOrder = [];

  final List<Map<String, dynamic>> options = [
    {
      'title': 'To learn how to make douas',
      'icon': Icons.menu_book,
    },
    {
      'title': 'To join the douas community',
      'icon': Icons.volunteer_activism,
    },
    {
      'title': 'By curiosity',
      'icon': Icons.search,
    },
    {
      'title': 'To find islamic reminders',
      'icon': Icons.calendar_today,
    },
    {
      'title': 'For something else',
      'icon': Icons.public,
    },
  ];

  void _toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
        selectedOrder.remove(option);
      } else if (selectedOptions.length < 3) {
        selectedOptions.add(option);
        selectedOrder.add(option);
      }
    });
  }

  void _continue() {
    if (selectedOptions.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            userName: userName,
            selectedInterests: selectedOptions.toList(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1B4332), // Dark green
              Color(0xFF081C3A), // Navy blue
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logout Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await _authService.signOut();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      tooltip: 'Logout',
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Islamic Logo with Crescent
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '☪',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Arabic Text "ذِكْر"
                const Text(
                  'ذِكْر',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 32),

                // Welcome Text - Large, centered white text
                Text(
                  'Welcome $userName!',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Instruction Text - Smaller white text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'What brings you to My.Zikr? Choose up to 3 so we can customize your navigation.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Options
                Expanded(
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final option = options[index];
                      final isSelected = selectedOptions.contains(option['title']);
                      
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: OptionCard(
                          title: option['title'],
                          icon: option['icon'],
                          isSelected: isSelected,
                          onTap: () => _toggleOption(option['title']),
                        ),
                      );
                    },
                  ),
                ),
                
                // Selection Counter
                Text(
                  '${selectedOptions.length}/3 selected',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 16),

                // Continue Button - Light neutral color with dark text
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedOptions.isNotEmpty ? _continue : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color(0xFFF5F5DC), // Beige/off-white
                      foregroundColor: const Color(0xFF1A1A1A), // Very dark gray/black
                      disabledBackgroundColor: const Color(0xFFF5F5DC).withOpacity(0.5),
                      disabledForegroundColor: const Color(0xFF1A1A1A).withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
