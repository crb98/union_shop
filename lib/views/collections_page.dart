import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';
import 'package:union_shop/views/collection_page.dart';
import 'package:union_shop/widgets/collection_tile.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.0,
                      children: [
                        CollectionTile(
                          title: 'Collection 1',
                          imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Collection 1')),
                          ),
                        ),

                        CollectionTile(
                          title: 'Collection 2',
                          imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Collection 2')),
                          ),
                        ),

                        CollectionTile(
                          title: 'Collection 3',
                          imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet2_1024x1024@2x.jpg?v=1752230283',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Collection 3')),
                          ),
                        ),

                        CollectionTile(
                          title: 'Collection 4',
                          imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCap_1024x1024@2x.jpg?v=1752235000',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Collection 4')),
                          ),
                        ),
                      ],
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
}