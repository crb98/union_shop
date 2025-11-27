import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';

class SaleCollectionPage extends StatefulWidget {
  const SaleCollectionPage({super.key, this.title = 'Sale'});

  final String title;

  @override
  State<SaleCollectionPage> createState() => _SaleCollectionPageState();
}

class _SaleCollectionPageState extends State<SaleCollectionPage> {
  // example sale products (title + original price + sale price)
  final List<Map<String, String>> products = const [
    {'title': 'Portsmouth Hoodie', 'price': '£25.00', 'sale': '£18.00'},
    {'title': 'University T‑Shirt', 'price': '£12.00', 'sale': '£8.00'},
    {'title': 'Campus Mug', 'price': '£6.50', 'sale': '£4.50'},
    {'title': 'Scarlet Scarf', 'price': '£9.00', 'sale': '£6.00'},
    {'title': 'Keyring', 'price': '£4.00', 'sale': '£2.50'},
    {'title': 'Notebook', 'price': '£5.00', 'sale': '£3.50'},
    {'title': 'Portsmouth Cap', 'price': '£10.00', 'sale': '£7.00'},
    {'title': 'Drawstring Bag', 'price': '£8.00', 'sale': '£5.50'},
    {'title': 'Limited Tote', 'price': '£7.50', 'sale': '£5.00'},
    {'title': 'Promo Badge Pack', 'price': '£3.00', 'sale': '£1.99'},
    {'title': 'Varsity Jacket', 'price': '£48.00', 'sale': '£36.00'},
    {'title': 'Grad Gown Hire', 'price': '£35.00', 'sale': '£25.00'},
  ];

  final List<String> filters = [
    'All products',
    'Clothing',
    'Merchandise',
    'Popular',
    'PSUT',
    'University merch'
  ];

  final List<String> sorts = [
    'Featured',
    'Best selling',
    'Alphabetically, A - Z',
    'Alphabetically, Z - A',
    'Price, low - high',
    'Price, high - low',
    'Date, old to new',
    'Date, new to old'
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
                'Current sale items. UI-only filters and sorting are provided for layout purposes only.',
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
                    Text('${products.length} products',
                        style: const TextStyle(color: Colors.black54)),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 3 x 4 grid - non-interactive tiles showing title + sale price (with original struck through)
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
                      color: Colors.grey.shade50,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              prod['title'] ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            if ((prod['sale'] ?? '').isNotEmpty)
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    prod['sale'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF0A72D8),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    prod['price'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              )
                            else
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