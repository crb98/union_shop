import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  static const imagePath = 'assets/images/hoodie.jpg';
  static const title = 'Classic Sweatshirts';
  static const price = '£25.00';
  static const salePrice = '';

  final List<String> colours = ['Black', 'Purple', 'Grey', 'Green'];
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  String selectedColour = 'Black';
  String selectedSize = 'M';
  int quantity = 1;

  void _incrementQty() {
    setState(() {
      if (quantity < 99) quantity++;
    });
  }

  void _decrementQty() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

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
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (c, e, st) {
                      return Container(
                        color: Colors.grey.shade100,
                        child: const Center(
                            child:
                                Icon(Icons.image_not_supported, color: Colors.grey)),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox.shrink(),
              const Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              if (salePrice.isNotEmpty)
                const Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(salePrice,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF0A72D8))),
                  SizedBox(width: 12),
                  Text(price,
                      style: TextStyle(
                          fontSize: 16, decoration: TextDecoration.lineThrough, color: Colors.black54)),
                ])
              else
                const Text(price, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              const Text(
                  'Bringing to you, our best selling Classic Sweatshirt. Available in 4 different colours. Soft, comfortable, 50% cotton and 50% polyester.'),
              const SizedBox(height: 16),

              // Options: Colour & Size
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Colour', style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: selectedColour,
                          items: colours
                              .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                              .toList(),
                          onChanged: (v) {
                            if (v == null) return;
                            setState(() => selectedColour = v);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          initialValue: selectedSize,
                          items: sizes
                              .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                              .toList(),
                          onChanged: (v) {
                            if (v == null) return;
                            setState(() => selectedSize = v);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Quantity selector
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Quantity', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: _decrementQty,
                        ),
                        Text('$quantity', style: const TextStyle(fontSize: 16)),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _incrementQty,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: const Text('Add to cart')),
            ]),
          ),
        ),
      ),
    );
  }
}