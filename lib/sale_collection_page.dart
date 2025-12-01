import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';
import 'package:union_shop/product_page.dart';

class SaleCollectionPage extends StatefulWidget {
  const SaleCollectionPage({super.key, this.title = 'Sale'});

  final String title;

  @override
  State<SaleCollectionPage> createState() => _SaleCollectionPageState();
}

class _SaleCollectionPageState extends State<SaleCollectionPage> {
  final List<Map<String, String>> products = const [
    {
      'title': 'Portsmouth Hoodie',
      'price': '£25.00',
      'sale': '£18.00',
      'image': 'assets/images/hoodie.jpg'
    },
    {
      'title': 'University T‑Shirt',
      'price': '£12.00',
      'sale': '£8.00',
      'image': 'assets/images/t-shirt.jpg'
    },
    {
      'title': 'Campus Mug',
      'price': '£6.50',
      'sale': '£4.50',
      'image': 'assets/images/mug.jpg'
    },
    {
      'title': 'Scarlet Scarf',
      'price': '£9.00',
      'sale': '£6.50',
      'image': 'assets/images/scarf.jpg'
    },
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

              // PRODUCTS SECTION — same visual layout as main.dart / collection_page.dart
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount:
                            MediaQuery.of(context).size.width > 600 ? 2 : 1,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 48,
                        // gives vertical room for image + text like other pages
                        childAspectRatio: 0.78,
                        children: products.map((prod) {
                          final title = prod['title'] ?? '';
                          final price = prod['price'] ?? '';
                          final sale = (prod['sale'] ?? '').isNotEmpty ? prod['sale']! : '';
                          // show sale card (navigates to ProductPage)
                          return SaleProductCard(
                            title: title,
                            price: price,
                            salePrice: sale,
                            imageUrl: prod['image'] ?? '',
                          );
                        }).toList(),
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

// Reusable sale product card matching other pages' product layout.
class SaleProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String salePrice;
  final String imageUrl;

  const SaleProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.salePrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProductPage()),
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
            // image area (supports local assets or network URLs)
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                child: imageUrl.isNotEmpty
                    ? (imageUrl.startsWith('http')
                        ? Image.network(imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, st) {
                            return Container(
                              color: Colors.grey.shade100,
                              child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                            );
                          })
                        : Image.asset(imageUrl, fit: BoxFit.cover, errorBuilder: (c, e, st) {
                            return Container(
                              color: Colors.grey.shade100,
                              child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                            );
                          }))
                    : Container(color: Colors.grey.shade100),
              ),
            ),

            // title + price / sale row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  if (salePrice.isNotEmpty)
                    Row(
                      children: [
                        Text(salePrice, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF0A72D8))),
                        const SizedBox(width: 8),
                        Text(price, style: const TextStyle(fontSize: 12, color: Colors.black54, decoration: TextDecoration.lineThrough)),
                      ],
                    )
                  else
                    Text(price, style: const TextStyle(fontSize: 13, color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}