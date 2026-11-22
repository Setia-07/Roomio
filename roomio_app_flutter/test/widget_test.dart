import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roomio_app/theme/roomio_theme.dart';
import 'package:roomio_app/widgets/compatibility_badge.dart';
import 'package:roomio_app/widgets/roomio_button.dart';

void main() {
  group('Roomio UI Components Quality Audit Tests', () {
    testWidgets(
      'CompatibilityBadge renders score and uses appropriate color coding',
      (
        WidgetTester tester,
      ) async {
        // High score (>= 80%) -> Mint
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: CompatibilityBadge(score: 92.5),
            ),
          ),
        );

        expect(find.text('93%'), findsOneWidget);
        expect(find.text('Match'), findsOneWidget);

        // Moderate score (60-79%) -> Amber
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: CompatibilityBadge(score: 68.0),
            ),
          ),
        );
        await tester.pump();
        expect(find.text('68%'), findsOneWidget);

        // Low score (< 60%) -> Rose
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: CompatibilityBadge(score: 45.0),
            ),
          ),
        );
        await tester.pump();
        expect(find.text('45%'), findsOneWidget);
      },
    );

    testWidgets('RoomioButton renders label and responds to tap', (
      WidgetTester tester,
    ) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoomioButton(
              text: 'Find Flatmates',
              onPressed: () {
                wasTapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Find Flatmates'), findsOneWidget);
      await tester.tap(find.text('Find Flatmates'));
      await tester.pump();

      expect(wasTapped, isTrue);
    });

    testWidgets(
      'RoomioButton displays CircularProgressIndicator when loading',
      (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: RoomioButton(
                text: 'Save Listing',
                isLoading: true,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Save Listing'), findsNothing);
      },
    );

    test('RoomioTheme validates brand palette constants', () {
      expect(RoomioColors.primary, equals(const Color(0xFFFF5A36)));
      expect(RoomioColors.navy, equals(const Color(0xFF141B2D)));
      expect(RoomioColors.mint, equals(const Color(0xFF10B981)));
      expect(RoomioColors.rose, equals(const Color(0xFFEF4444)));
    });
  });
}
