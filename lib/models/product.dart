class Product {
  final String id;
  final String title;
  final String price;
  final String salePrice;
  final String image; 

  const Product({
    required this.id,
    required this.title,
    required this.price,
    this.salePrice = '',
    required this.image,
  });

  bool get onSale => salePrice.isNotEmpty;
}