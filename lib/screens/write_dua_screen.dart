import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';

class WriteDuaScreen extends StatefulWidget {
  const WriteDuaScreen({super.key});

  @override
  State<WriteDuaScreen> createState() => _WriteDuaScreenState();
}

class _WriteDuaScreenState extends State<WriteDuaScreen> {
  final int _currentNavIndex = 1; // Duas is active
  final TextEditingController _duaController = TextEditingController(
    text: 'Yâ Allah, I pray for every muslim in the world, for their well-being, their sustenance, their Akhira and their whole family.',
  );

  @override
  void dispose() {
    _duaController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    if (index != _currentNavIndex) {
      // Navigate back and let the home screen handle navigation
      Navigator.pop(context);
    }
  }

  void _onPublish() {
    if (_duaController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please write a dua before publishing'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Your dua has been submitted for review. May Allah accept it.'),
        duration: Duration(seconds: 3),
      ),
    );

    // Navigate back after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Text
                const Text(
                  'Write a dua',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 12),

                // Subtext/Instructions
                const Text(
                  'Write a doua and share it with the community and allow people to say Amine. Your doua will randomly be displayed after review.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 32),

                // Dua Input Area
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5DC), // Light off-white background
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF2C3E50).withOpacity(0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: _duaController,
                    maxLines: 8,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF1A1A1A),
                      height: 1.6,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write your dua here...',
                      hintStyle: TextStyle(
                        color: Color(0xFF9E9E9E),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Disclaimer/Instructions
                const Text(
                  'By publishing a dua, you agree not to include personal data, illicit or prohibited content, or material/financial requests. Shared duas are for spiritual support only and may be displayed anonymously to the community.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFB0B0B0),
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 32),

                // Publish Button
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onPublish,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F5DC), // Light beige/off-white
                        foregroundColor: const Color(0xFF1A1A1A), // Dark text
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Publish',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 100), // Space for bottom navigation
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentNavIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

