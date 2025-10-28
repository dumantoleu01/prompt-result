import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prompt_result/main.dart';

void main() {
  testWidgets('App starts with prompt page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('AI Image Generator'), findsOneWidget);
    expect(find.text('Generate'), findsOneWidget);
  });

  testWidgets('Generate button is disabled with empty input', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final generateButton = find.widgetWithText(ElevatedButton, 'Generate');
    expect(generateButton, findsOneWidget);

    final button = tester.widget<ElevatedButton>(generateButton);
    expect(button.onPressed, isNull);
  });

  testWidgets('Generate button is enabled with text input', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField), 'A beautiful sunset over mountains');
    await tester.pump();

    final generateButton = find.widgetWithText(ElevatedButton, 'Generate');
    final button = tester.widget<ElevatedButton>(generateButton);
    expect(button.onPressed, isNotNull);
  });
}
