class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Fiyat "$999" formatında geliyor, $ ve , temizliyoruz
    final rawPrice = json['price'].toString().replaceAll(RegExp(r'[^\d.]'), '');
    return Product(
      id:          json['id'] as int,
      name:        json['name'] ?? '',
      description: json['description'] ?? '',
      price:       double.tryParse(rawPrice) ?? 0.0,
      imageUrl:    json['image'] ?? '',
    );
  }
}