import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/sale_collection_page.dart';
import 'package:union_shop/views/about_us_page.dart';
import 'package:union_shop/views/collections_page.dart';
import 'package:union_shop/views/collection_page.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/widgets/product_card.dart';

void main() {
  testWidgets('SaleCollectionPage shows title, filters and sale tiles', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const SaleCollectionPage(),
        routes: {
          '/about': (c) => const AboutUsPage(),
          '/collections': (c) => const CollectionsPage(),
          '/collection': (c) => const CollectionPage(title: 'Collection'),
          '/product': (c) => const ProductPage(),
        },
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Sale'), findsOneWidget);
    expect(find.byType(DropdownButton<String>), findsNWidgets(2));
    expect(find.byType(GridView), findsOneWidget);

    // ensure at least one product tile is rendered on the sale page
    expect(find.byType(ProductCard), findsAtLeastNWidgets(1));
  });
}