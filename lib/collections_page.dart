import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';
import 'package:union_shop/collection_page.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final collections = <Map<String, String>>[
      {'title': 'Collection 1', 'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'},
      {'title': 'Collection 2', 'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561'},
      {'title': 'Collection 3', 'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet2_1024x1024@2x.jpg?v=1752230283'},
      {'title': 'Collection 4', 'image': 'https://shop.upsu.net/cdn/shop/files/PortsmouthCap_1024x1024@2x.jpg?v=1752235000'},
    ];

    return AppShell(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Collections',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Collections Grid
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 800 ? 3 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.0,
                      children: collections.map((item) {
                        final title = item['title']!;
                        final imageUrl = item['image']!;
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => CollectionPage(title: title)),
                            ),
                            child: _collectionTile(title, imageUrl),
                          ),
                        );
                      }).toList(),
                     ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // collection tile: image with centered title on top (darkened image)
  Widget _collectionTile(String title, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (c, e, st) {
                return Container(
                  color: Colors.grey.shade100,
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),

            // uniform dark overlay to improve text contrast (no gradient)
            Container(color: const Color.fromRGBO(0, 0, 0, 0.35)),

            // centered title on top of image
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    shadows: [
                      Shadow(blurRadius: 6, color: Colors.black54, offset: Offset(0, 2))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}