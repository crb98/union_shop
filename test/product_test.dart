import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/product_page.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget() {

      return const MaterialApp(home: ProductPage());
    }

    testWidgets('displays product title, image and price', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // match the hardcoded title used in ProductPage
      expect(find.textContaining('Classic Sweatshirts'), findsOneWidget);
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('shows description and Add to cart button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.textContaining('Bringing to you, our best selling Classic Sweatshirt.'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Add to cart'), findsOneWidget);
    });
  });
}
