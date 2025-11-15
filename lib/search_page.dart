import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search products, categories or keywords',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}