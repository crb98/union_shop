import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/site_shell.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: 320,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: product.image.startsWith('http')
                      ? Image.network(product.image, fit: BoxFit.cover, width: double.infinity)
                      : Image.asset(product.image, fit: BoxFit.cover, width: double.infinity),
                ),
              ),
              const SizedBox(height: 16),
              Text(product.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              if (product.onSale)
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(product.salePrice, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF0A72D8))),
                  const SizedBox(width: 12),
                  Text(product.price, style: const TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough, color: Colors.black54)),
                ])
              else
                Text(product.price, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              const Text('Product description and options go here.'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: const Text('Add to cart')),
            ]),
          ),
        ),
      ),
    );
  }
}