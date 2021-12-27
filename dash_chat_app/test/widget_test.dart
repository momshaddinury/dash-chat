// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dash_chat_app/features/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login screen render test', (){
    testWidgets('Has Login Heading and button', (WidgetTester tester) async{
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );
      await tester.pump();
      expect(find.text('Login'), findsWidgets);
    });

    testWidgets('Has TextFields', (WidgetTester tester) async{
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );
      await tester.pump();
      expect(find.byType(TextField), findsWidgets);
    });
  });
}
