import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_background.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

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
                'Islamic Reminders',
                style: AppTheme.headingStyle.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 16),
              Text(
                'Set up daily reminders for prayers and duas',
                style: AppTheme.bodyStyle,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 80,
                        color: AppTheme.textGray,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Reminder screen coming soon...',
                        style: AppTheme.bodyStyle.copyWith(
                          color: AppTheme.textGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
