import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';

class DummyProductPage extends StatefulWidget {
  final String? title;
  const DummyProductPage({super.key, this.title});

  @override
  State<DummyProductPage> createState() => _DummyProductPageState();
}

class _DummyProductPageState extends State<DummyProductPage> {
  final List<String> imageUrls = const [
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet2_1024x1024@2x.jpg?v=1752230283',
    'https://shop.upsu.net/cdn/shop/files/PortsmouthCap_1024x1024@2x.jpg?v=1752235000',
  ];

  int selectedIndex = 0;

  // product option state
  final List<String> colours = ['Black', 'Purple', 'Grey', 'Bottle green'];
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  String selectedColour = 'Black';
  String selectedSize = 'M';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final title = widget.title ?? 'Classic Sweatshirts';

    return AppShell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: LayoutBuilder(builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 800;

            Widget imageColumn = Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Main image
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrls[selectedIndex],
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, st) => Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Thumbnails
                SizedBox(
                  height: 72,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (ctx, i) {
                      final isSelected = i == selectedIndex;
                      return GestureDetector(
                        onTap: () => setState(() => selectedIndex = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: isSelected ? const EdgeInsets.all(3) : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            border: isSelected ? Border.all(color: const Color(0xFF4d2963), width: 2) : null,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              imageUrls[i],
                              width: 72,
                              height: 72,
                              fit: BoxFit.cover,
                              errorBuilder: (c, e, st) => Container(
                                width: 72,
                                height: 72,
                                color: Colors.grey[300],
                                child: const Icon(Icons.image_not_supported, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );

            Widget detailsColumn = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  '£23.00',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4d2963)),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Bringing to you, our best selling Classic Sweatshirt. Available in 4 different colours. Soft, comfortable, 50% cotton and 50% polyester.',
                  style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                ),
                const SizedBox(height: 16),

                // Options row: Colour, Size, Quantity
                Row(
                  children: [
                    // Colour
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: selectedColour,
                        decoration: const InputDecoration(
                          labelText: 'Colour',
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                        items: colours
                            .map((c) =>
                                DropdownMenuItem(value: c, child: Text(c)))
                            .toList(),
                        onChanged: (v) {
                          if (v == null) return;
                          setState(() => selectedColour = v);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Size
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

                    // Quantity
                    SizedBox(
                      width: 110,
                      child: DropdownButtonFormField<int>(
                        initialValue: quantity,
                        decoration: const InputDecoration(
                          labelText: 'Qty',
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                        items: List.generate(10, (i) => i + 1)
                            .map((n) =>
                                DropdownMenuItem(value: n, child: Text(n.toString())))
                            .toList(),
                        onChanged: (v) {
                          if (v == null) return;
                          setState(() => quantity = v);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
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
            );

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: imageColumn),
                  const SizedBox(width: 24),
                  Expanded(flex: 5, child: detailsColumn),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageColumn,
                  const SizedBox(height: 18),
                  detailsColumn,
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}