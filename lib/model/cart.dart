import 'dart:convert';
import 'package:dart_tester/model/cart_produk.dart';

class Cart {
  final int id;
  final int userId;
  final List<CartProduk> products;
  Cart({
    required this.id,
    required this.userId,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      products: List<CartProduk>.from(map['products']?.map((x) => CartProduk.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(id: $id, userId: $userId, products: $products)';

}