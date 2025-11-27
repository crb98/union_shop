import 'package:flutter/material.dart';

const _brandColor = Color(0xFF4d2963);

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void placeholder() {}
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // thin top banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: _brandColor,
            child: const Text(
              'PLACEHOLDER HEADER TEXT',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          // main header row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
                  child: Image.network(
                    'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                    height: 28,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
                  ),
                ),
                Expanded(
                  child: Builder(builder: (innerCtx) {
                    final isWide = MediaQuery.of(innerCtx).size.width >= 800;
                    Widget navLink(String label, VoidCallback onTap) {
                      return TextButton(
                        onPressed: onTap,
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
                        child: Text(label, style: const TextStyle(fontSize: 14)),
                      );
                    }

                    if (isWide) {
                      return Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            navLink('Home', () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false)),
                            const SizedBox(width: 12),
                            navLink('Shop', placeholder),
                            const SizedBox(width: 12),
                            navLink('About', () => Navigator.pushNamed(innerCtx, '/about')),
                            const SizedBox(width: 12),
                            navLink('SALE!', () => Navigator.pushNamed(innerCtx, '/sale')),
                            const SizedBox(width: 12),
                            navLink('UPSU.net', placeholder),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: IconButton(
                          icon: const Icon(Icons.menu, size: 20, color: Colors.grey),
                          onPressed: placeholder,
                        ),
                      );
                    }
                  }),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search, size: 20, color: Colors.grey),
                      onPressed: () => Navigator.pushNamed(context, '/search'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.person_outline, size: 20, color: Colors.grey),
                      onPressed: () => Navigator.pushNamed(context, '/signin'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined, size: 20, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Widget _section(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        ...children.map((w) => Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: w)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(builder: (ctx, constraints) {
        final isWide = constraints.maxWidth >= 600;
        final left = _section('Opening Hours', [
          const Text('(Term Time)', style: TextStyle(color: Colors.grey)),
          const Text('Mon–Fri 9am – 4pm', style: TextStyle(color: Colors.grey)),
        ]);
        final center = _section('Help and Info', [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/search'),
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: const Align(alignment: Alignment.centerLeft, child: Text('Search', style: TextStyle(color: Colors.grey))),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero), overlayColor: WidgetStateProperty.all(Colors.transparent)),
            child: const Align(alignment: Alignment.centerLeft, child: Text('Terms & Conditions of Sale', style: TextStyle(color: Colors.grey))),
          ),
        ]);
        final right = _section('Latest Offers', [
          Row(children: [
            Expanded(
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'Email address', isDense: true, border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: _brandColor, padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
              child: const Text('Subscribe', style: TextStyle(fontSize: 14)),
            ),
          ])
        ]);

        if (isWide) {
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: left),
            Expanded(child: center),
            Expanded(child: right),
          ]);
        } else {
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [left, const SizedBox(height: 16), center, const SizedBox(height: 16), right]);
        }
      }),
    );
  }
}

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            child,
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}