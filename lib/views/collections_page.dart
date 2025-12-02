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
                          title: 'Essential Range',
                          imageUrl: 'assets/images/essential_range.jpg',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Essential Range')),
                          ),
                        ),

                        CollectionTile(
                          title: 'Pride Collection',
                          imageUrl: 'assets/images/pride_collection.jpg',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Pride Collection')),
                          ),
                        ),

                        CollectionTile(
                          title: 'Clothing',
                          imageUrl: 'assets/images/clothing.jpg',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Clothing')),
                          ),
                        ),

                        CollectionTile(
                          title: 'Merchandise',
                          imageUrl: 'assets/images/merchandise.jpg',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Merchandise')),
                          ),
                        ),

                        CollectionTile(
                          title: 'Graduation',
                          imageUrl: 'assets/images/graduation.jpg',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Graduation')),
                          ),
                        ),

                        CollectionTile(
                          title: 'Popular',
                          imageUrl: 'assets/images/popular.jpg',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const CollectionPage(title: 'Popular')),
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