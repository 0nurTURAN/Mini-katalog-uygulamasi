import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String productsUrl = 'https://wantapi.com/products.php';
  static const String bannerUrl   = 'https://wantapi.com/assets/banner.png';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(productsUrl));
    if (response.statusCode != 200) {
      throw Exception('Hata: ${response.statusCode}');
    }
    final Map<String, dynamic> json = jsonDecode(response.body);
    final List<dynamic> data = json['data'];
    return data.map((e) => Product.fromJson(e)).toList();
  }
}