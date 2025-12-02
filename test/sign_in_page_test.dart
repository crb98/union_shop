import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/sign_in_page.dart';
import 'package:union_shop/views/about_us_page.dart';
import 'package:union_shop/views/collections_page.dart';
import 'package:union_shop/views/collection_page.dart';
import 'package:union_shop/views/sale_collection_page.dart';
import 'package:union_shop/views/product_page.dart';

void main() {
  testWidgets('SignInPage shows title, email field and continue button', (tester) async {
    await tester.pumpWidget(
      MaterialApp( // remove const so non-const page constructors are allowed
        home: const SignInPage(),
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

    expect(find.text('Sign in'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Continue'), findsOneWidget);
  });
}