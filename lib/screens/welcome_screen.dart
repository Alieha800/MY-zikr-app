import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/option_card.dart';
import '../widgets/gradient_background.dart';
import '../services/local_auth_service.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Set<String> selectedOptions = {};
  final LocalAuthService _authService = LocalAuthService();

  String get userName {
    return _authService.currentUser?.displayName ?? "User";
  }

  final List<Map<String, dynamic>> options = [
    {
      'title': 'To learn how to make duas',
      'icon': Icons.school_outlined,
    },
    {
      'title': 'To join the duas community',
      'icon': Icons.people_outline,
    },
    {
      'title': 'By curiosity',
      'icon': Icons.explore_outlined,
    },
    {
      'title': 'To find Islamic reminders',
      'icon': Icons.notifications_outlined,
    },
    {
      'title': 'For something else',
      'icon': Icons.more_horiz,
    },
  ];

  void _toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else if (selectedOptions.length < 3) {
        selectedOptions.add(option);
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
      body: GradientBackground(
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
                        color: AppTheme.textWhite,
                      ),
                      tooltip: 'Logout',
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // App Logo Placeholder
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppTheme.cardBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.mosque,
                    size: 50,
                    color: AppTheme.accentGold,
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Welcome Text
                Text(
                  'Welcome $userName!',
                  style: AppTheme.headingStyle.copyWith(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 16),
                
                // Subtitle
                const Text(
                  'Please tell us what you are here for so we can customize your navigation. You can select up to 3.',
                  style: AppTheme.bodyStyle,
                  textAlign: TextAlign.center,
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
                  style: AppTheme.bodyStyle.copyWith(
                    color: AppTheme.textGray,
                    fontSize: 14,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedOptions.isNotEmpty ? _continue : null,
                    child: const Text('Continue'),
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
