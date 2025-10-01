import 'package:flutter/material.dart';
import '../widgets/dua_card.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/custom_bottom_nav.dart';
import 'duas_screen.dart';
import 'reminder_screen.dart';
import 'profile_screen.dart';
import 'wall_of_duas_screen.dart';

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
  final String duaArabic = "اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّي";
  final String duaTransliteration = "Allahuma innaka affuwun tuhibun afwa fafu anni";
  final String duaTranslation = "Ya Allah, You are the forgiver, you love to forgive, so forgive me";

  final List<Map<String, dynamic>> recommendations = [
    {
      'title': 'Dua for anxiety',
      'icon': Icons.sentiment_satisfied_alt,
    },
    {
      'title': 'Dua for gratitude',
      'icon': Icons.sentiment_satisfied_alt,
    },
    {
      'title': 'The wall of Duas',
      'icon': Icons.volunteer_activism,
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
    if (title == 'The wall of Duas') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WallOfDuasScreen(),
        ),
      );
    } else {
      // Placeholder for other recommendation detail screens
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Opening $title'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Bar with Logo and Notification
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo and App Name
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '☪',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'My.Zikr',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              // Notification Icon with Text
              Row(
                children: [
                  const Text(
                    'Morning duas',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Greeting
          Text(
            'Salam Aleykoum $currentUserName!',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 32),

          // Dua of the day section
          const Text(
            'Dua of the day',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          DuaCard(
            arabicText: duaArabic,
            transliteration: duaTransliteration,
            translation: duaTranslation,
            onPlayAudio: _onPlayAudio,
            onFavoriteToggle: _onFavoriteToggle,
          ),

          const SizedBox(height: 32),

          // Customize recommendations section
          const Text(
            'Customize your recommendations',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          // Customize button
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF1B4332), // Dark green
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _onCustomizeRecommendations,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.sentiment_satisfied_alt,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'How do you feel today?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Recommendations section
          const Text(
            'Recommendations for you',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF1B4332), // Dark green/teal on left
              Color(0xFF081C3A), // Darker blue/black on right
            ],
          ),
        ),
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
