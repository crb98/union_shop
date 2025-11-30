import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> colours = ['Black', 'Purple', 'Grey', 'Bottle green'];
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  String selectedColour = 'Black';
  String selectedSize = 'M';
  int quantity = 1;

  void placeholderCallbackForButtons() {
    // placeholder for non-functional buttons
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'images/pexels-aden-ardenrich-181745-581339.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_not_supported,
                                size: 64,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Image unavailable',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Product name
              const Text(
                'Classic Sweatshirts',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 12),

              // Product price
              const Text(
                '£23.00',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
              ),

              const SizedBox(height: 24),

              // Product description
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Bringing to you, our best selling Classic Sweatshirt. Available in 4 different colours.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              // Options row
              Row(
                children: [
                  // Colour dropdown
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedColour,
                      decoration: const InputDecoration(
                        labelText: 'Colour',
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                      items: colours
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (v) {
                        if (v == null) return;
                        setState(() => selectedColour = v);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Size dropdown
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: selectedSize,
                      decoration: const InputDecoration(
                        labelText: 'Size',
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                      items: sizes
                          .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                          .toList(),
                      onChanged: (v) {
                        if (v == null) return;
                        setState(() => selectedSize = v);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Quantity buttons
                  SizedBox(
                    width: 120,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Qty',
                        isDense: true,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (quantity > 1) setState(() => quantity -= 1);
                            },
                          ),
                          Text(quantity.toString(), style: const TextStyle(fontSize: 16)),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() => quantity += 1);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Add to cart button (placeholder)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                child: const Text('Add to cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}