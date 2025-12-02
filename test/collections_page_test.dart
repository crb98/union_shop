import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collections_page.dart';

void main() {
  testWidgets('CollectionsPage displays header and grid', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CollectionsPage()));
    await tester.pumpAndSettle();

    expect(find.text('Collections'), findsWidgets);
    expect(find.byType(GridView), findsOneWidget);
  });
}