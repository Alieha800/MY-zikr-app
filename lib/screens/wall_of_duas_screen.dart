import 'package:flutter/material.dart';
import 'write_dua_screen.dart';

class WallOfDuasScreen extends StatefulWidget {
  const WallOfDuasScreen({super.key});

  @override
  State<WallOfDuasScreen> createState() => _WallOfDuasScreenState();
}

class _WallOfDuasScreenState extends State<WallOfDuasScreen> {
  final List<Map<String, dynamic>> duaPosts = [
    {
      'user': 'Aziz',
      'dua': 'Yâ Allah, I pray for every muslim in the world, for their well-being and happiness. May You protect them and guide them on the right path.',
      'amineCount': 127,
    },
    {
      'user': 'Fatoumata',
      'dua': 'Yâ Allah, help me find a decent job where my hijab is accepted and where I can practice my faith freely. Grant me patience and strength.',
      'amineCount': 54,
    },
  ];

  void _onAmineTap(int index) {
    setState(() {
      duaPosts[index]['amineCount']++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Amine said! May Allah accept this dua.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onLocationTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Location filter coming soon'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onThemeTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Theme filter coming soon'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onWriteDuaTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WriteDuaScreen(),
      ),
    );
  }

  void _onAskForDuaTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ask for dua screen coming soon'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header - Large, left-aligned
                const Text(
                  'The wall of douas',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtext and Filter/Settings Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtext - Centered/Left
                    const Expanded(
                      child: Text(
                        'Douas of My.zikr community close to your location. Support them by saying Amine.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Filter/Settings - Right-aligned
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _onLocationTap,
                          child: const Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: _onThemeTap,
                          child: const Text(
                            'Theme',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: _onThemeTap,
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 20,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 32),

              // Dua Posts
              ...duaPosts.asMap().entries.map((entry) {
                final index = entry.key;
                final post = entry.value;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5DC), // Light off-white background
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF2C3E50).withOpacity(0.2), // Dark blue/gray border
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dua Text
                        Text(
                          post['dua'],
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF1A1A1A),
                            height: 1.6,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Bottom Row: Amine Button, User, Count
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Amine Button
                            GestureDetector(
                              onTap: () => _onAmineTap(index),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2C3E50), // Dark blue/purple
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'Amine',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            // User and Count
                            Row(
                              children: [
                                Text(
                                  post['user'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF4A4A4A),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2C3E50),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${post['amineCount']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),

              const SizedBox(height: 180), // Space for FABs and bottom nav
            ],
          ),
        ),

        // Floating Action Buttons - Bottom Right
        Positioned(
          right: 16,
          bottom: 100, // Above bottom navigation
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Ask for doua FAB (Top)
              GestureDetector(
                onTap: _onAskForDuaTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B4332), // Dark green
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Ask for doua',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Write a doua FAB (Bottom)
              GestureDetector(
                onTap: _onWriteDuaTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C3E50), // Dark blue/purple
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Write a doua',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}

