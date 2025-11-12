import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:exam_schedule/main.dart';

void main() {
  testWidgets('App starts and shows exam list', (WidgetTester tester) async {
    await tester.pumpWidget(const IspitiRasporedApp());

    expect(find.text('Распоред за испити - 201234'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}
