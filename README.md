# My.Zikr - Islamic Dua App

A beautiful Flutter mobile app for Islamic duas with modern, spiritual design.

## Features

- **Welcome Screen**: Personalized onboarding with selectable interests
- **Home Screen**: Daily dua with Arabic text and English translation
- **Audio Playback**: Play button for dua pronunciation (UI placeholder)
- **Favorites**: Heart button to save favorite duas
- **Recommendations**: Personalized dua suggestions
- **Bottom Navigation**: Easy access to Duas, Reminders, and Profile

## Design

- **Theme**: Modern, minimal, spiritual Islamic-inspired design
- **Colors**: Gradient background (dark green → dark blue)
- **Typography**: Elegant Arabic script for duas, clean sans-serif for translations
- **UI Elements**: Rounded buttons and cards for modern feel

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. Clone the repository
2. Navigate to the project directory
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

### Font Setup

To use custom Arabic fonts:
1. Download Amiri font files and place them in `assets/fonts/`
2. Download Roboto font files and place them in `assets/fonts/`
3. Run `flutter pub get` to refresh assets

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── theme/
│   └── app_theme.dart       # App-wide theme and styling
├── screens/
│   ├── welcome_screen.dart  # Onboarding screen
│   ├── home_screen.dart     # Main home screen
│   ├── duas_screen.dart     # Duas collection (placeholder)
│   ├── reminder_screen.dart # Reminders (placeholder)
│   └── profile_screen.dart  # User profile
└── widgets/
    ├── gradient_background.dart    # Reusable gradient background
    ├── option_card.dart           # Selectable option cards
    ├── dua_card.dart             # Dua display with Arabic text
    ├── recommendation_card.dart   # Recommendation list items
    └── custom_bottom_nav.dart    # Bottom navigation bar
```

## Current Status

This is a UI-only implementation focusing on:
- ✅ Modern Islamic-inspired design
- ✅ Welcome screen with selectable interests
- ✅ Home screen with dua of the day
- ✅ Navigation between screens
- ✅ Reusable UI components
- ✅ Responsive design for iOS/Android

## Next Steps

- [ ] Backend integration (Firebase/Supabase)
- [ ] Audio playback functionality
- [ ] Dua database and search
- [ ] Push notifications for reminders
- [ ] User authentication
- [ ] Favorites persistence
- [ ] Offline support

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.
