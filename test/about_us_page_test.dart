import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/about_us_page.dart';

void main() {
  testWidgets('AboutUsPage shows heading and content', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AboutUsPage()));
    await tester.pumpAndSettle();

    expect(find.text('About Us'), findsOneWidget);
    expect(find.textContaining('Welcome to the Union Shop'), findsOneWidget);
  });
}