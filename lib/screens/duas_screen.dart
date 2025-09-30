import 'package:flutter/material.dart';
import 'wall_of_duas_screen.dart';

class DuasScreen extends StatefulWidget {
  const DuasScreen({super.key});

  @override
  State<DuasScreen> createState() => _DuasScreenState();
}

class _DuasScreenState extends State<DuasScreen> {
  String selectedFilter = 'Authentic douas';
  final TextEditingController _customDuaController = TextEditingController();

  final List<String> filters = [
    'All',
    'Authentic douas',
    'For kids',
    'For Haj',
  ];

  final List<String> popularDuas = [
    'I have an exam',
    'I want to marry',
    'I want a baby',
    'I need money for rent',
  ];

  @override
  void dispose() {
    _customDuaController.dispose();
    super.dispose();
  }

  void _onFilterTap(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  void _onPopularDuaTap(String dua) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening: $dua'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _onWallOfDuasTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WallOfDuasScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Douas',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          // Subtext
          const Text(
            'Douas to connect to Allah and to find comfort with heartfelt words',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          // Filter Buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters.map((filter) {
                final isSelected = filter == selectedFilter;
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: GestureDetector(
                    onTap: () => _onFilterTap(filter),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF5F5DC) // Light background
                            : const Color(0xFF2C3E50), // Dark background
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFF1A1A1A) // Dark text
                              : Colors.white, // White text
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 32),

          // Custom Duas Section
          const Text(
            'Custom douas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'What do you have in mind, let\'s us help you explain it to Allah',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          // Text Area
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2C3E50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: _customDuaController,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Write down you feeling like I need help to get a job...',
                hintStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Most Popular Section
          const Text(
            'Most popular Douas asked',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          // Popular Duas Buttons
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: popularDuas.map((dua) {
              return GestureDetector(
                onTap: () => _onPopularDuaTap(dua),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C3E50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    dua,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 32),

          // Discover Section
          const Text(
            'Discover the wall of douas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Find out douas that people made and support them by saying \'Amine\'.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          // The Wall of Duas Button
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF2C3E50), // Dark blue
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _onWallOfDuasTap,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.volunteer_activism,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'The wall of Duas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
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

          const SizedBox(height: 100), // Space for bottom nav
        ],
      ),
    );
  }
}
