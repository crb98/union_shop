import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_collection_page.dart';

void main() {
  testWidgets('SaleCollectionPage shows title, filters and sale tiles', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SaleCollectionPage()));
    await tester.pumpAndSettle();

    expect(find.text('Sale'), findsOneWidget);
    expect(find.byType(DropdownButton<String>), findsNWidgets(2));
    // check a sale price is present from the hardcoded list
    expect(find.text('£18.00'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });
}