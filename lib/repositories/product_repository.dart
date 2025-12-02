import 'package:union_shop/models/product.dart';

class ProductRepository {
  static const products = <Product>[
    Product(
      id: 'hoodie',
      title: 'Portsmouth Hoodie',
      price: '£25.00',
      image: 'assets/images/hoodie.jpg',
    ),
    Product(
      id: 'tshirt',
      title: 'University T‑Shirt',
      price: '£12.00',
      salePrice: '£8.00',
      image: 'assets/images/t-shirt.jpg',
    ),
    Product(
      id: 'mug',
      title: 'Campus Mug',
      price: '£6.50',
      salePrice: '£4.50',
      image: 'assets/images/mug.jpg',
    ),
    Product(
      id: 'scarf',
      title: 'Scarlet Scarf',
      price: '£9.00',
      salePrice: '£6.50',
      image: 'assets/images/scarf.jpg',
    ),
  ];

  List<Product> fetchAll() => products;

  List<Product> fetchSale() => products.where((p) => p.onSale).toList();

  Product? fetchById(String id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}