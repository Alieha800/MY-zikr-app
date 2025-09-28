import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_zikr_app/main.dart';

void main() {
  group('My.Zikr App Tests', () {
    testWidgets('App starts with Welcome Screen', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyZikrApp());

      // Verify that the welcome screen is displayed
      expect(find.text('Welcome Ahmad!'), findsOneWidget);
      expect(find.text('Please tell us what you are here for so we can customize your navigation. You can select up to 3.'), findsOneWidget);
    });

    testWidgets('Welcome screen has selectable options', (WidgetTester tester) async {
      await tester.pumpWidget(const MyZikrApp());

      // Verify that interest options are displayed
      expect(find.text('To learn how to make duas'), findsOneWidget);
      expect(find.text('To join the duas community'), findsOneWidget);
      expect(find.text('By curiosity'), findsOneWidget);
      expect(find.text('To find Islamic reminders'), findsOneWidget);
      expect(find.text('For something else'), findsOneWidget);
    });

    testWidgets('Continue button is initially disabled', (WidgetTester tester) async {
      await tester.pumpWidget(const MyZikrApp());

      // Find the continue button
      final continueButton = find.text('Continue');
      expect(continueButton, findsOneWidget);

      // Verify button is disabled (onPressed is null)
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('Selecting an option enables continue button', (WidgetTester tester) async {
      await tester.pumpWidget(const MyZikrApp());

      // Tap on the first option
      await tester.tap(find.text('To learn how to make duas'));
      await tester.pump();

      // Verify button is now enabled
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNotNull);

      // Verify selection counter
      expect(find.text('1/3 selected'), findsOneWidget);
    });

    testWidgets('Can navigate to home screen', (WidgetTester tester) async {
      await tester.pumpWidget(const MyZikrApp());

      // Select an option
      await tester.tap(find.text('To learn how to make duas'));
      await tester.pump();

      // Tap continue button
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Verify we're on the home screen
      expect(find.text('Salam Aleykoum Ahmad!'), findsOneWidget);
      expect(find.text('Dua of the day'), findsOneWidget);
    });
  });
}
