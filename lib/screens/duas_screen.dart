import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_background.dart';

class DuasScreen extends StatelessWidget {
  const DuasScreen({super.key});

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
                'Duas Collection',
                style: AppTheme.headingStyle.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 16),
              Text(
                'Browse through our collection of authentic duas',
                style: AppTheme.bodyStyle,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.book_outlined,
                        size: 80,
                        color: AppTheme.textGray,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Duas screen coming soon...',
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
