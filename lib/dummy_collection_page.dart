import 'package:flutter/material.dart';
import 'package:union_shop/widgets/site_shell.dart';

class DummyCollectionPage extends StatelessWidget {
  final String title;
  const DummyCollectionPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text(
                'Placeholder for the collection. Replace with real collection content (product grid, filters, etc.).',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 700 ? 3 : 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: List.generate(6, (i) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(child: Text('Item ${i+1}')),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}