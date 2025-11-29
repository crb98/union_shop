import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/dummy_collection_page.dart';

void main() {
  testWidgets('DummyCollectionPage shows title, filters and product tiles', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DummyCollectionPage(title: 'Test Collection')));
    await tester.pumpAndSettle();

    expect(find.text('Test Collection'), findsOneWidget);
    expect(find.byType(DropdownButton<String>), findsNWidgets(2));
    // check product title from the hardcoded list
    expect(find.text('Portsmouth Hoodie'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });
}