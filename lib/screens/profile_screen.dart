import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_background.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final List<String> selectedInterests;

  const ProfileScreen({
    super.key,
    required this.userName,
    required this.selectedInterests,
  });

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: AppTheme.headingStyle.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 32),
              
              // Profile Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppTheme.accentGold,
                        child: Text(
                          userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        userName,
                        style: AppTheme.subheadingStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'May Allah bless you',
                        style: AppTheme.bodyStyle.copyWith(
                          color: AppTheme.textGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Interests Section
              Text(
                'Your Interests',
                style: AppTheme.subheadingStyle,
              ),
              const SizedBox(height: 16),
              
              ...selectedInterests.map((interest) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: AppTheme.accentGold,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            interest,
                            style: AppTheme.bodyStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )).toList(),
              
              const Spacer(),
              
              // Settings placeholder
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: AppTheme.textWhite,
                  ),
                  title: Text(
                    'Settings',
                    style: AppTheme.bodyStyle,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.textGray,
                    size: 16,
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Settings screen coming soon...'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
