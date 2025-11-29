import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/dummy_product_page.dart';

void main() {
  testWidgets('DummyProductPage displays images, title, price, options and add to cart', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DummyProductPage()));
    await tester.pumpAndSettle();

    expect(find.text('Placeholder Product Name'), findsOneWidget);
    expect(find.text('£15.00'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.byType(Image), findsWidgets); // main + thumbnails
    expect(find.byType(DropdownButtonFormField<String>), findsNWidgets(2)); // colour + size
    expect(find.byType(DropdownButtonFormField<int>), findsOneWidget); // quantity
    expect(find.widgetWithText(ElevatedButton, 'Add to cart'), findsOneWidget);
  });
}