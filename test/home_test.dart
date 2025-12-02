import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/product_card.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('app builds and shows product cards and header icons', (tester) async {
      // use non-const to avoid constructor mismatches
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // At least one product card should be present
      expect(find.byType(ProductCard), findsAtLeastNWidgets(1));

      // Product images should be rendered
      expect(find.byType(Image), findsWidgets);

      // header has interactive icon buttons (menu/search/cart etc.)
      expect(find.byType(IconButton), findsWidgets);
    });

    testWidgets('home shows expected product title and price fragments', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // tolerant string checks (match fragments used in product data)
      expect(find.textContaining('Hoodie'), findsAtLeastNWidgets(1));
      expect(find.textContaining('£'), findsWidgets);
    });
  });
}
