class AppConstants {
  // App Information
  static const String appName = 'My.Zikr';
  static const String appVersion = '1.0.0';
  
  // Sample Duas
  static const Map<String, String> sampleDuas = {
    'daily': 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    'morning': 'اللَّهُمَّ بِكَ أَصْبَحْنَا وَبِكَ أَمْسَيْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ',
    'evening': 'اللَّهُمَّ بِكَ أَمْسَيْنَا وَبِكَ أَصْبَحْنَا وَبِكَ نَحْيَا وَبِكَ نَمُوتُ وَإِلَيْكَ الْمَصِيرُ',
  };
  
  static const Map<String, String> sampleTranslations = {
    'daily': 'Our Lord, give us good in this world and good in the next world, and save us from the punishment of the Fire.',
    'morning': 'O Allah, by You we enter the morning and by You we enter the evening, by You we live and by You we die, and to You is the resurrection.',
    'evening': 'O Allah, by You we enter the evening and by You we enter the morning, by You we live and by You we die, and to You is our return.',
  };
  
  // User Interest Options
  static const List<Map<String, dynamic>> interestOptions = [
    {
      'title': 'To learn how to make duas',
      'icon': 'school_outlined',
    },
    {
      'title': 'To join the duas community',
      'icon': 'people_outline',
    },
    {
      'title': 'By curiosity',
      'icon': 'explore_outlined',
    },
    {
      'title': 'To find Islamic reminders',
      'icon': 'notifications_outlined',
    },
    {
      'title': 'For something else',
      'icon': 'more_horiz',
    },
  ];
  
  // Recommendation Categories
  static const List<Map<String, dynamic>> recommendationCategories = [
    {
      'title': 'Dua for anxiety',
      'icon': 'healing',
      'description': 'Find peace and comfort through Islamic prayers',
    },
    {
      'title': 'Dua for gratitude',
      'icon': 'favorite',
      'description': 'Express thankfulness to Allah',
    },
    {
      'title': 'The wall of Duas',
      'icon': 'wall',
      'description': 'Community shared duas and experiences',
    },
    {
      'title': 'Morning Duas',
      'icon': 'wb_sunny',
      'description': 'Start your day with blessed prayers',
    },
    {
      'title': 'Evening Duas',
      'icon': 'nights_stay',
      'description': 'End your day with peaceful prayers',
    },
  ];
  
  // Islamic Greetings
  static const List<String> islamicGreetings = [
    'Salam Aleykoum',
    'Assalamu Alaikum',
    'Peace be upon you',
  ];
  
  // App Settings
  static const int maxInterestSelections = 3;
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration snackBarDuration = Duration(seconds: 2);
}
