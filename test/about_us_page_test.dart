import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/about_us_page.dart';
import 'package:union_shop/views/collections_page.dart';
import 'package:union_shop/views/collection_page.dart';
import 'package:union_shop/views/sale_collection_page.dart';
import 'package:union_shop/views/product_page.dart';

Future<void> pumpApp(WidgetTester tester, Widget home) async {
  await tester.pumpWidget(
    MaterialApp(
      home: home,
      routes: {
        '/about': (c) => const AboutUsPage(),
        '/collections': (c) => const CollectionsPage(),
        '/collection': (c) => const CollectionPage(title: 'Collection'),
        '/sale': (c) => const SaleCollectionPage(),
        '/product': (c) => const ProductPage(),
      },
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('AboutUsPage shows heading and content', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AboutUsPage()));
    await tester.pumpAndSettle();

    expect(find.text('About Us'), findsOneWidget);
    expect(find.textContaining('Welcome to the Union Shop'), findsOneWidget);
  });
}