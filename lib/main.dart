import 'package:flutter/material.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/views/about_us_page.dart';
import 'package:union_shop/views/sign_in_page.dart';
import 'package:union_shop/views/collections_page.dart';
import 'package:union_shop/views/sale_collection_page.dart';
import 'package:union_shop/widgets/site_shell.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/repositories/product_repository.dart';
import 'package:union_shop/widgets/product_card.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      routes: {
        // ProductPage requires a Product; navigate to it using MaterialPageRoute(product: ...)
        '/about': (context) => const AboutUsPage(),
        '/signin': (context) => const SignInPage(),
        '/collections': (context) => const CollectionsPage(),
        '/sale': (context) => const SaleCollectionPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    // use AppShell which already provides header and footer
    return AppShell(
      child: Column(
        children: [
          // Hero Section
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage('assets/images/hero_Banner.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withAlpha((0.55 * 255).round()),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 24,
                  right: 24,
                  top: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'SHOP OUR ESSENTIAL RANGE',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Come and grab yours while stock lasts!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/collections'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text(
                          'BROWSE COLLECTIONS',
                          style: TextStyle(fontSize: 14, letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Products Section (constrained to match collection_page.dart sizing)
          Container(
            color: Colors.white,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
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
                      Builder(builder: (context) {
                        final repo = ProductRepository();
                        final products = repo.fetchAll();
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 600 ? 2 : 1,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 48,
                          // same aspect ratio used in collection_page.dart
                          childAspectRatio: 0.78,
                          children: products.map((p) => ProductCard(product: p)).toList(),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Our Range Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'OUR RANGE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    LayoutBuilder(builder: (ctx, constraints) {
                      final isWide = constraints.maxWidth >= 800;

                      Widget box(String label) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                label,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      if (isWide) {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(child: AspectRatio(aspectRatio: 1, child: box('Clothing'))),
                            const SizedBox(width: 16),
                            Expanded(child: AspectRatio(aspectRatio: 1, child: box('Merchandise'))),
                            const SizedBox(width: 16),
                            Expanded(child: AspectRatio(aspectRatio: 1, child: box('Graduation'))),
                            const SizedBox(width: 16),
                            Expanded(child: AspectRatio(aspectRatio: 1, child: box('SALE'))),
                          ],
                        );
                      } else {
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1,
                          children: [
                            box('Clothing'),
                            box('Merchandise'),
                            box('Graduation'),
                            box('SALE'),
                          ],
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),

          // personalisation section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: LayoutBuilder(builder: (ctx, constraints) {
                  final isWide = constraints.maxWidth >= 700;

                  final leftBlock = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add a Personal Touch',
                        style: TextStyle(fontSize: 20, height: 1.5, color: Colors.black87),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'First add your item of clothing to your cart then click below to add your text! One line of text contains 10 characters!',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                          child: const Text(
                            'CLICK HERE TO ADD TEXT!',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );

                  final blueSquare = SizedBox(
                    width: 420,
                    height: 420,
                    child: Container(
                      color: const Color(0xFF0A72D8),
                    ),
                  );

                  if (isWide) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: leftBlock),
                        const SizedBox(width: 24),
                        blueSquare,
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        leftBlock,
                        const SizedBox(height: 16),
                        Center(child: blueSquare),
                      ],
                    );
                  }
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
