import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:squirrel_flutter_app/main.dart';

void main() {
  testWidgets('Test squirrel guessing game', (WidgetTester tester) async {
    // Build the widget tree and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the initial state of the game is displayed correctly.
    expect(find.text('Once moved on there is no going back \n 10 numbers left\n\n'), findsOneWidget);
    expect(find.text('Score:'), findsNothing);

    // Tap the "NO" button.
    await tester.tap(find.text('NO'));
    await tester.pump();

    // Verify that the number decreases and the game is not over yet.
    expect(find.text('Once moved on there is no going back \n 9 numbers left\n\n'), findsOneWidget);
    expect(find.text('Score:'), findsNothing);

    // Tap the "YES" button.
    await tester.tap(find.text('YES'));
    await tester.pump();

    // Verify that the game over screen is displayed and the score is calculated correctly.
    expect(find.text('Largest number:'), findsOneWidget);
    expect(find.text('Your number:'), findsOneWidget);
    expect(find.text('Score:'), findsOneWidget);

    // Tap the "Retry" button.
    await tester.tap(find.text('Retry'));
    await tester.pump();

    // Verify that the game starts over.
    expect(find.text('Once moved on there is no going back \n 10 numbers left\n\n'), findsOneWidget);
    expect(find.text('Score:'), findsNothing);
  });
}
