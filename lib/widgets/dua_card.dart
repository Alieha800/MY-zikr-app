import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DuaCard extends StatefulWidget {
  final String arabicText;
  final String translation;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onPlayAudio;

  const DuaCard({
    super.key,
    required this.arabicText,
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Arabic Text
            Text(
              widget.arabicText,
              style: AppTheme.arabicTextStyle,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            
            const SizedBox(height: 16),
            
            // Translation
            Text(
              widget.translation,
              style: AppTheme.translationTextStyle,
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 20),
            
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Play Audio Button
                IconButton(
                  onPressed: widget.onPlayAudio,
                  icon: const Icon(Icons.play_circle_outline),
                  color: AppTheme.textWhite,
                  iconSize: 32,
                ),
                
                const SizedBox(width: 24),
                
                // Favorite Button
                IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  color: _isFavorite ? AppTheme.accentGold : AppTheme.textWhite,
                  iconSize: 32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
