import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';
import 'package:union_shop/repositories/product_repository.dart';
import 'package:union_shop/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  final repo = ProductRepository();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = repo.fetchAll();
    return AppShell(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(children: [
              const Text('PRODUCTS SECTION', style: TextStyle(fontSize: 20, letterSpacing: 1)),
              const SizedBox(height: 48),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                childAspectRatio: 0.78,
                children: products.map((p) => ProductCard(product: p)).toList(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}