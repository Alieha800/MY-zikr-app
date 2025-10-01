import 'package:flutter/material.dart';

class DuaCard extends StatefulWidget {
  final String arabicText;
  final String? transliteration;
  final String translation;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onPlayAudio;

  const DuaCard({
    super.key,
    required this.arabicText,
    this.transliteration,
    required this.translation,
    this.isFavorite = false,
    this.onFavoriteToggle,
    this.onPlayAudio,
  });

  @override
  State<DuaCard> createState() => _DuaCardState();
}

class _DuaCardState extends State<DuaCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    widget.onFavoriteToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5DC), // Light off-white/beige background
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Arabic Text (Elegant calligraphy)
          Text(
            widget.arabicText,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
              height: 1.8,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),

          const SizedBox(height: 20),

          // Transliteration (if provided)
          if (widget.transliteration != null) ...[
            Text(
              widget.transliteration!,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Color(0xFF4A4A4A),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],

          // Translation
          Text(
            widget.translation,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF4A4A4A),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Play Audio Button (Speaker icon on left)
              IconButton(
                onPressed: widget.onPlayAudio,
                icon: const Icon(Icons.volume_up),
                color: const Color(0xFF1A1A1A),
                iconSize: 28,
              ),

              // Favorite Button (Heart icon on right)
              IconButton(
                onPressed: _toggleFavorite,
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                color: _isFavorite ? Colors.red : const Color(0xFF1A1A1A),
                iconSize: 28,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
