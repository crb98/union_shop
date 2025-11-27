import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_us_page.dart';
import 'package:union_shop/sign_in_page.dart';
import 'package:union_shop/collections_page.dart';

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
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutUsPage(),
        '/signin': (context) => const SignInPage(),
        '/collections': (context) => const CollectionsPage(),
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
    return Scaffold(
      backgroundColor: Colors.white,
       body: SingleChildScrollView(
         child: Column(
          children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'PLACEHOLDER HEADER TEXT',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),

                          // center area that holds nav (or menu on small screens)
                          Expanded(
                            child: Builder(builder: (innerContext) {
                              final isWide =
                                  MediaQuery.of(innerContext).size.width >= 800;

                              Widget navLink(String label) {
                                return TextButton(
                                  onPressed: placeholderCallbackForButtons,
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                                    foregroundColor: WidgetStateProperty.resolveWith((states) {
                                      if (states.contains(WidgetState.hovered) ||
                                          states.contains(WidgetState.pressed)) {
                                        return Colors.black87;
                                      }
                                      return Colors.grey;
                                    }),
                                  ),
                                  child: Text(label,
                                      style: const TextStyle(fontSize: 14)),
                                );
                              }

                              if (isWide) {
                                return Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      navLink('Home'),
                                      const SizedBox(width: 12),
                                      navLink('Shop'),
                                      const SizedBox(width: 12),
                                      navLink('The Print Shack'),
                                      const SizedBox(width: 12),
                                      navLink('SALE!'),
                                      const SizedBox(width: 12),
                                      // About link navigates to /about
                                      TextButton(
                                        onPressed: () => Navigator.pushNamed(innerContext, '/about'),
                                        style: ButtonStyle(
                                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                                          overlayColor: WidgetStateProperty.all(Colors.transparent),
                                          foregroundColor: WidgetStateProperty.resolveWith((states) {
                                            if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
                                              return Colors.black87;
                                            }
                                            return Colors.grey;
                                          }),
                                        ),
                                        child: const Text('About', style: TextStyle(fontSize: 14)),
                                      ),
                                      const SizedBox(width: 12),
                                      navLink('UPSU.net'),                                                                          
                                    ],
                                  ),
                                );
                              } else {
                                // collapsed -> show a menu button (centered between logo and icons)
                                return Center(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.menu,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    constraints: const BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    onPressed: placeholderCallbackForButtons,
                                  ),
                                );
                              }
                            }),
                          ),

                          // icons on the far right
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: placeholderCallbackForButtons,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.person_outline,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: () => Navigator.pushNamed(context, '/signin'),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: placeholderCallbackForButtons,
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

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Placeholder Hero Title',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "This is placeholder text for the hero section.",
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

            // Products Section
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
                      children: const [
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

            // Our Range Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // centre title and content
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
                          // four square boxes in one centered row
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
                          // responsive fallback: two columns on small screens
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

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 600;

                  Widget section(String title, List<Widget> items) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )),
                        const SizedBox(height: 8),
                        ...items.map((w) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: w,
                            )),
                      ],
                    );
                  }

                  // create controller for the email field
                  final emailController = TextEditingController();

                  final left = section('Opening Hours', [
                    const Text('(Term Time)',
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    const Text('Monday - Friday 9am - 4pm',
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    const Text('(Outside of Term Time / Consolidation Weeks)',
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    const Text('Monday - Friday 9am - 3pm',
                        style: TextStyle(color: Colors.grey, fontSize: 14)),     
                    const Text('Purchase online 24/7',
                        style: TextStyle(color: Colors.grey, fontSize: 14)),                                               
                  ]);

                  final center = section('Help and Info', [
                    TextButton(
                      onPressed: placeholderCallbackForButtons,
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                        foregroundColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.hovered) ||
                              states.contains(WidgetState.pressed)) {
                            return Colors.black87;
                          }
                          return Colors.grey;
                        }),
                        alignment: Alignment.centerLeft,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Search',
                            style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    TextButton(
                      onPressed: placeholderCallbackForButtons,
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                        foregroundColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.hovered) ||
                              states.contains(WidgetState.pressed)) {
                            return Colors.black87;
                          }
                          return Colors.grey;
                        }),
                        alignment: Alignment.centerLeft,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Terms & Conditions of Sale Policy',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                  ]);

                  final right = section('Latest Offers', [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'Email address',
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                            ),
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            placeholderCallbackForButtons();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          child: const Text('Subscribe',
                              style: TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                  ]);

                  if (isWide) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: left),
                        Expanded(child: center),
                        Expanded(child: right),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        left,
                        const SizedBox(height: 16),
                        center,
                        const SizedBox(height: 16),
                        right,
                      ],
                    );
                  }
                },
              ),
            ),
          ],
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
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
