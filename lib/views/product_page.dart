import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    const imagePath = 'assets/images/hoodie.jpg';
    const title = 'Classic Sweatshirts';
    const price = '£25.00';
    const salePrice = ''; 

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
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (c, e, st) {
                      return Container(
                        color: Colors.grey.shade100,
                        child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey)),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox.shrink(),
              const Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              if (salePrice.isNotEmpty)
                const Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(salePrice, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF0A72D8))),
                  SizedBox(width: 12),
                  Text(price, style: const TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough, color: Colors.black54)),
                ])
              else
                const Text(price, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              const Text('Bringing to you, our best selling Classic Sweatshirt. Available in 4 different colours. Soft, comfortable, 50% cotton and 50% polyester.'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: const Text('Add to cart')),
            ]),
          ),
        ),
      ),
    );
  }
}