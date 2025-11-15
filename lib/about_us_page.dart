import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _placeholder() {
    // no-op for now
  }

  Widget _navLink(String label, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return Colors.black87;
          }
          return Colors.grey;
        }),
      ),
      child: Text(label, style: const TextStyle(fontSize: 14)),
    );
  }

  Widget _footerSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        ...items.map((w) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: w,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final logo = GestureDetector(
      onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
      child: Image.network(
        'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
        height: 28,
        fit: BoxFit.contain,
        errorBuilder: (c, e, st) => const Icon(Icons.image_not_supported, size: 28),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // top thin banner
            Container(
              width: double.infinity,
              color: const Color(0xFF4d2963),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              child: const SafeArea(
                bottom: false,
                child: Text(
                  'PLACEHOLDER HEADER TEXT',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // header: logo, centered nav, icons on right
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                children: [
                  // logo left
                  logo,

                  // nav center (expands)
                  Expanded(
                    child: Builder(builder: (innerCtx) {
                      final isWide = MediaQuery.of(innerCtx).size.width >= 800;
                      if (isWide) {
                        return Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _navLink('Home', () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false)),
                              const SizedBox(width: 12),
                              _navLink('Products', _placeholder),
                              const SizedBox(width: 12),
                              _navLink('Offers', _placeholder),
                              const SizedBox(width: 12),
                              _navLink('Contact', _placeholder),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: IconButton(
                            icon: const Icon(Icons.menu, color: Colors.grey, size: 20),
                            onPressed: _placeholder,
                          ),
                        );
                      }
                    }),
                  ),

                  // icons right
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, size: 20, color: Colors.grey),
                        onPressed: () => Navigator.pushNamed(context, '/search'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.person_outline, size: 20, color: Colors.grey),
                        onPressed: _placeholder,
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_bag_outlined, size: 20, color: Colors.grey),
                        onPressed: _placeholder,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // hero/banner for About Us
            Container(
              width: double.infinity,
              color: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'About Us',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'The Union Shop provides a wide range of university-branded merchandise, essentials and offers for students.',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),

            // main content (simple)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: const Text(
                  'We are committed to serving the student community with quality products, fair pricing and convenient services. '
                  'This page is a stub for your About Us content — add mission, team, sustainability notes and other details here.',
                  style: TextStyle(fontSize: 15, height: 1.5),
                ),
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey.shade50,
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: LayoutBuilder(builder: (ctx, constraints) {
                  final isWide = constraints.maxWidth >= 600;

                  final left = _footerSection('Opening Hours', [
                    const Text('(Term Time)', style: TextStyle(color: Colors.grey)),
                    const Text('Mon–Fri 9am – 4pm', style: TextStyle(color: Colors.grey)),
                    const Text('(Outside Term Time) Mon–Fri 9am – 3pm',
                        style: TextStyle(color: Colors.grey)),
                    const Text('Purchase online 24/7', style: TextStyle(color: Colors.grey)),
                  ]);

                  final center = _footerSection('Help and Info', [
                    TextButton(
                      onPressed: () => Navigator.pushNamed(ctx, '/search'),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        foregroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.black87;
                          }
                          return Colors.grey;
                        }),
                        alignment: Alignment.centerLeft,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Search', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    TextButton(
                      onPressed: _placeholder,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        foregroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.black87;
                          }
                          return Colors.grey;
                        }),
                        alignment: Alignment.centerLeft,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Terms & Conditions of Sale', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ]);

                  final right = _footerSection('Latest Offers', [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: _placeholder, // no confirmation shown
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          ),
                          child: const Text('Subscribe', style: TextStyle(fontSize: 14)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.email, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('shop@upsu.net', style: TextStyle(color: Colors.grey)),
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
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}