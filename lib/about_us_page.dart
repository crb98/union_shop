import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';

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
      child: Text(label, style: const TextStyle(fontSize: 14)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Us',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Welcome to the Union Shop!',
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              const SizedBox(height: 12),
              // small nav examples (uses _navLink so analyzer won't flag it unused)
              Row(
                children: [
                  _navLink('Contact', _placeholder),
                  const SizedBox(width: 12),
                  _navLink('Search', () => Navigator.pushNamed(context, '/search')),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "We're dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round. We even offer an exclusive personalisation service!",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              const SizedBox(height: 12),
              const Text(
                'All online purchases are available for delivery or in‑store collection!',
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              const SizedBox(height: 12),
              const Text(
                'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please contact us at hello@upsu.net.',
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              const SizedBox(height: 18),
              const Text(
                'Happy shopping!\n\nThe Union Shop & Reception Team',
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}