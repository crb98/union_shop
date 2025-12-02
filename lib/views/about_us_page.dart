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

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Welcome to the Union Shop!',
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              SizedBox(height: 12),
              Text(
                "We're dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round. We even offer an exclusive personalisation service!",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              SizedBox(height: 12),
              Text(
                'All online purchases are available for delivery or in‑store collection!',
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              SizedBox(height: 12),
              Text(
                'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please contact us at hello@upsu.net.',
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
              SizedBox(height: 18),
              Text(
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