import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';

class CollectionPage extends StatefulWidget {
  final String title;
  const CollectionPage({super.key, required this.title});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
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

              // PRODUCTS SECTION (same layout as main.dart)
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
                        // <1.0 gives extra vertical room for title/price under the square image
                        childAspectRatio: 0.78,
                        children: [
                          ProductCard(
                            title: 'Placeholder Product 1',
                            price: '£10.00',
                            imageUrl:
                                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          ),
                          ProductCard(
                            title: 'Placeholder Product 2',
                            price: '£15.00',
                            imageUrl:
                                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          ),
                          ProductCard(
                            title: 'Placeholder Product 3',
                            price: '£20.00',
                            imageUrl:
                                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          ),
                          ProductCard(
                            title: 'Placeholder Product 4',
                            price: '£25.00',
                            imageUrl:
                                'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          ),
                        ],
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

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // use Expanded so the image fills available tile height and the text area keeps visible
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),

            // title / price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}