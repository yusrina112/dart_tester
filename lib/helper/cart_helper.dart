import 'package:dart_tester/model/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartHelper {
  final Map<String, String> _header = {
    "Content-type":"application/json"
  };

  // method mendapatkan semua data Produk
  Future<List<dynamic>> getAllCart() async {
    var url = Uri.parse("https://fakestoreapi.com/carts");
    try {
      var respon = await http.get(url);
      if(respon.statusCode == 200) {
        List<dynamic> json = jsonDecode(respon.body);
        return json.map((item)=> Cart.fromMap(item)).toList();
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }

  // method tambah produk baru
  Future<int> createCart(Cart cart) async {
     var url = Uri.parse("https://fakestoreapi.com/carts");
    try {
      var respon = await http.post(url, headers: _header,body: jsonEncode({
        'id' : cart.id,
        'userId' : cart.userId,
        'products' : cart.products.map((p) =>p.toMap()).toList(),
      }));
      if(respon.statusCode == 201) {
        var json = jsonDecode(respon.body);
        return json["id"];
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    } 
  }

  // method ambil data produk berdasarkan id
  Future<Cart> getCartById(int id) async {
    var url = Uri.parse("https://fakestoreapi.com/carts/$id");
    try {
      var respon = await http.get(url);
      if(respon.statusCode == 200) {
        Map <String, dynamic> json = jsonDecode(respon.body);
          return Cart.fromMap(json);
      } else {
        int kode = respon.statusCode;
        throw Exception("Error koneksi status :$kode");
      }
    } catch (e) {
      throw Exception("Error :$e");
    } 
  }

  // method update produk
  Future<Cart> updateCart(Cart cart) async{
    var url = Uri.parse("https://fakestoreapi.com/carts/${cart.id}");
    try {
      var respon = await http.put(url, headers: _header, body: jsonEncode({
        'id' : cart.id,
        'userId' : cart.userId,
        'products' : cart.products.map((p)=> p.toMap()).toList(),
      }));
      if (respon.statusCode == 200) {
           Map<String, dynamic> json = jsonDecode(respon.body);
            return Cart.fromMap(json);
        } else {
          throw Exception("Error status code :${respon.statusCode}");
        }
      } catch (e) {
        throw Exception("Error :$e");
      }
  }
}