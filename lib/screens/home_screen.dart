import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_background.dart';
import '../widgets/dua_card.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/custom_bottom_nav.dart';
import 'duas_screen.dart';
import 'reminder_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  final List<String> selectedInterests;

  const HomeScreen({
    super.key,
    required this.userName,
    required this.selectedInterests,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  String get currentUserName {
    return widget.userName;
  }

  // Sample dua data - in a real app, this would come from a database
  final String duaOfTheDay = "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ";
  final String duaTranslation = "Our Lord, give us good in this world and good in the next world, and save us from the punishment of the Fire.";

  final List<Map<String, dynamic>> recommendations = [
    {
      'title': 'Dua for anxiety',
      'icon': Icons.healing,
    },
    {
      'title': 'Dua for gratitude',
      'icon': Icons.favorite,
    },
    {
      'title': 'The wall of Duas',
      'icon': Icons.forum,
    },
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentNavIndex = index;
    });
  }

  Widget _getCurrentScreen() {
    switch (_currentNavIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const DuasScreen();
      case 2:
        return const ReminderScreen();
      case 3:
        return ProfileScreen(
          userName: currentUserName,
          selectedInterests: widget.selectedInterests,
        );
      default:
        return _buildHomeContent();
    }
  }

  void _onPlayAudio() {
    // Placeholder for audio playback functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Audio playback would start here'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onFavoriteToggle() {
    // Placeholder for favorite functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to favorites'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onCustomizeRecommendations() {
    // Placeholder for customization screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Customize recommendations screen would open here'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onRecommendationTap(String title) {
    // Placeholder for recommendation detail screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening $title'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          Text(
            'Salam Aleykoum $currentUserName!',
            style: AppTheme.headingStyle.copyWith(fontSize: 28),
          ),

          const SizedBox(height: 32),

          // Dua of the day section
          const Text(
            'Dua of the day',
            style: AppTheme.subheadingStyle,
          ),

          const SizedBox(height: 16),

          DuaCard(
            arabicText: duaOfTheDay,
            translation: duaTranslation,
            onPlayAudio: _onPlayAudio,
            onFavoriteToggle: _onFavoriteToggle,
          ),

          const SizedBox(height: 32),

          // Customize recommendations button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _onCustomizeRecommendations,
              icon: const Icon(Icons.tune),
              label: const Text('Customize your recommendations'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.cardBackground,
                foregroundColor: AppTheme.textWhite,
                side: const BorderSide(
                  color: AppTheme.accentGold,
                  width: 1,
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Recommendations section
          const Text(
            'Recommendations for you',
            style: AppTheme.subheadingStyle,
          ),

          const SizedBox(height: 16),

          // Recommendations list
          ...recommendations.map((recommendation) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: RecommendationCard(
              title: recommendation['title'],
              icon: recommendation['icon'],
              onTap: () => _onRecommendationTap(recommendation['title']),
            ),
          )).toList(),

          const SizedBox(height: 100), // Space for bottom nav
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: _getCurrentScreen(),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentNavIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
