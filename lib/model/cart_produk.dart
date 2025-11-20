import 'dart:convert';

class CartProduk {
  final int productId;
  final int quantity;

  CartProduk({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory CartProduk.fromMap(Map<String, dynamic> map) {
    return CartProduk(
      productId: map['productId'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProduk.fromJson(String source) => CartProduk.fromMap(json.decode(source));

  @override
  String toString() => 'CartProduk(productId: $productId, quantity: $quantity)';
}