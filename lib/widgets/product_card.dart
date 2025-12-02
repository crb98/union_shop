import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/views/product_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final imageWidget = product.image.startsWith('http')
        ? Image.network(product.image, fit: BoxFit.cover)
        : Image.asset(product.image, fit: BoxFit.cover);

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProductPage(product: product)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(6)), child: imageWidget)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                if (product.onSale)
                  Row(children: [
                    Text(product.salePrice, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF0A72D8))),
                    const SizedBox(width: 8),
                    Text(product.price, style: const TextStyle(fontSize: 12, color: Colors.black54, decoration: TextDecoration.lineThrough)),
                  ])
                else
                  Text(product.price, style: const TextStyle(fontSize: 13, color: Colors.black54)),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}