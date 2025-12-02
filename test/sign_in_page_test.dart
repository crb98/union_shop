import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/sign_in_page.dart';

void main() {
  testWidgets('SignInPage shows title, email field and continue button', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SignInPage()));
    await tester.pumpAndSettle();

    expect(find.text('Sign in'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Continue'), findsOneWidget);
  });
}