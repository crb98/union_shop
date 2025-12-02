import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collection_page.dart';

void main() {
  testWidgets('CollectionPage basic smoke test', (tester) async {
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(size: Size(1200, 800)),
        child: MaterialApp(
          home: CollectionPage(title: 'Test Collection'),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Test Collection'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });
}