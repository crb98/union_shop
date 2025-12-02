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
    Product(
      id: 'grad_gown',
      title: 'Grad Gown Hire',
      price: '£35.00',
      image: 'assets/images/grad_gown.jpg',
    ),
    Product(
      id: 'keyring',
      title: 'Keyring',
      price: '£4.00',
      image: 'assets/images/keyring.jpg',
    ),
    Product(
      id: 'varsity_jacket',
      title: 'Varsity Jacket',
      price: '£48.00',
      salePrice: '£36.00',
      image: 'assets/images/varsity_jacket.jpg',
    ),
    Product(
      id: 'notebook',
      title: 'Notebook',
      price: '£5.00',
      image: 'assets/images/notebook.jpg',
    ),
    Product(
      id: 'cap',
      title: 'Portsmouth Cap',
      price: '£10.00',
      salePrice: '£7.00',
      image: 'assets/images/cap.jpg',
    ),
    Product(
      id: 'drawstring_bag',
      title: 'Drawstring Bag',
      price: '£8.00',
      image: 'assets/images/drawstring_bag.jpg',
    ),
    Product(
      id: 'limited_tote',
      title: 'Limited Tote',
      price: '£7.50',
      image: 'assets/images/limited_tote.jpg',
    ),
    Product(
      id: 'badge_pack',
      title: 'Promo Badge Pack',
      price: '£3.00',
      salePrice: '£1.99',
      image: 'assets/images/badge_pack.jpg',
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