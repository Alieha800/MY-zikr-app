import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          // Selected: Light gray/off-white | Unselected: Dark green
          color: isSelected
              ? const Color(0xFFE8E8E8) // Light gray/off-white when selected
              : const Color(0xFF1B4332), // Dark green when unselected
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Icon on the left
            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF1A1A1A) // Dark color when selected
                  : Colors.white, // White when unselected
              size: 24,
            ),
            const SizedBox(width: 16),
            // Text
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFF1A1A1A) // Dark text when selected
                      : Colors.white, // White text when unselected
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            // Green checkmark when selected
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF2E7D32), // Green checkmark
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
