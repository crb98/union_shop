import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';
import 'package:union_shop/repositories/product_repository.dart';
import 'package:union_shop/widgets/product_card.dart';

class CollectionPage extends StatefulWidget {
  final String title;
  const CollectionPage({super.key, required this.title});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final List<String> filters = [
    'All products',
    'Clothing',
    'Merchandise',
    'Popular',
    'PSUT',
    'University merch',
  ];

  final List<String> sorts = [
    'Featured',
    'Best selling',
    'Alphabetically, A - Z',
    'Alphabetically, Z - A',
    'Price, low - high',
    'Price, high - low',
    'Date, old to new',
    'Date, new to old',
  ];

  String selectedFilter = 'All products';
  String selectedSort = 'Featured';

  @override
  Widget build(BuildContext context) {
    final repo = ProductRepository();
    final products = repo.fetchAll();

    return AppShell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,
                  style:
                      const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text(
                'Placeholder for the collection. Replace with real collection content (product grid, filters, etc.).',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),

              // Filter / Sort bar (UI only)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    DropdownButton<String>(
                      value: selectedFilter,
                      items: filters
                          .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                          .toList(),
                      onChanged: (v) {
                        if (v == null) return;
                        setState(() => selectedFilter = v);
                      },
                    ),
                    const SizedBox(width: 12),
                    DropdownButton<String>(
                      value: selectedSort,
                      items: sorts
                          .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                          .toList(),
                      onChanged: (v) {
                        if (v == null) return;
                        setState(() => selectedSort = v);
                      },
                    ),
                    const Spacer(),
                    Text('${products.length} products', style: const TextStyle(color: Colors.black54)),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // PRODUCTS SECTION (uses ProductRepository + shared ProductCard)
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      const Text(
                        'PRODUCTS SECTION',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 48),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount:
                            MediaQuery.of(context).size.width > 600 ? 2 : 1,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 48,
                        childAspectRatio: 0.78,
                        children: products.map((p) => ProductCard(product: p)).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}