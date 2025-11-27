import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';

class DummyCollectionPage extends StatefulWidget {
  final String title;
  const DummyCollectionPage({super.key, required this.title});

  @override
  State<DummyCollectionPage> createState() => _DummyCollectionPageState();
}

class _DummyCollectionPageState extends State<DummyCollectionPage> {
  // replace simple labels with product-like entries (title + price)
  final List<Map<String, String>> products = const [
    {'title': 'Portsmouth Hoodie', 'price': '£25.00'},
    {'title': 'University T‑Shirt', 'price': '£12.00'},
    {'title': 'Campus Mug', 'price': '£6.50'},
    {'title': 'Scarlet Scarf', 'price': '£9.00'},
    {'title': 'Grad Gown Hire', 'price': '£35.00'},
    {'title': 'Keyring', 'price': '£4.00'},
    {'title': 'Varsity Jacket', 'price': '£48.00'},
    {'title': 'Notebook', 'price': '£5.00'},
    {'title': 'Portsmouth Cap', 'price': '£10.00'},
    {'title': 'Drawstring Bag', 'price': '£8.00'},
    {'title': 'Limited Tote', 'price': '£7.50'},
    {'title': 'Promo Badge Pack', 'price': '£3.00'},
  ];

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

              // Filter / Sort bar (UI only, hardcoded options)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    // Filter dropdown (updates local state only)
                    DropdownButton<String>(
                      value: selectedFilter,
                      items: filters
                          .map((f) =>
                              DropdownMenuItem(value: f, child: Text(f)))
                          .toList(),
                      onChanged: (v) {
                        if (v == null) return;
                        setState(() => selectedFilter = v);
                      },
                    ),
                    const SizedBox(width: 12),

                    // Sort dropdown (updates local state only)
                    DropdownButton<String>(
                      value: selectedSort,
                      items: sorts
                          .map((s) =>
                              DropdownMenuItem(value: s, child: Text(s)))
                          .toList(),
                      onChanged: (v) {
                        if (v == null) return;
                        setState(() => selectedSort = v);
                      },
                    ),

                    const Spacer(),

                    // Product count on the right (hardcoded from items length)
                    Text('${products.length} products',
                        style: const TextStyle(color: Colors.black54)),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 3 x 4 non-interactive grid of square tiles
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
                children: products.map((prod) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              prod['title'] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              prod['price'] ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}