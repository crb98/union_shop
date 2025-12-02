import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collections_page.dart';
import 'package:union_shop/views/collection_page.dart';
import 'package:union_shop/views/sale_collection_page.dart';
import 'package:union_shop/views/product_page.dart';

void main() {
  testWidgets('CollectionsPage displays header and grid', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const CollectionsPage(), // avoid const to allow non-const constructors
        routes: {
          '/collection': (c) => const CollectionPage(title: 'Collection'),
          '/sale': (c) => const SaleCollectionPage(),
          '/product': (c) => const ProductPage(),
        },
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Collections'), findsWidgets);
    expect(find.byType(GridView), findsOneWidget);
  });
}