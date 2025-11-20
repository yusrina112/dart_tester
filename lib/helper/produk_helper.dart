import 'package:dart_tester/model/produkt.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdukHelper {
  final Map<String, String> header = {
    "Content-type":"application/json"
  };

  // method mendapatkan semua data Produk
  Future<List<dynamic>> getAllProduk() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    try {
      var respon = await http.get(url);
      if(respon.statusCode == 200) {
        // Konversi respon body menjadi dynamic
        var json = jsonDecode(respon.body);

        // tester return
        return json.map((item)=>Produk.fromMap(item)).toList();
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }

  // method update Produk
  Future<Produk> updateProduk(Produk p)async {
     var url = Uri.parse("https://fakestoreapi.com/products/${p.id}");
    try {
      var respon = await http.put(url, headers: header,body: jsonEncode(p.toMap()));
      if(respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return Produk.fromMap(json);
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    } 
  }
  // method membuat Produk baru
  Future<int> createProduk(Produk p) async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    try {
      var respon = await http.post(url, headers: header,body: jsonEncode(p.toMap()));
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

  // method ambil data Produk berdasarkan id
  Future<Produk> getProdukById(int id) async{
    var url = Uri.parse("https://fakestoreapi.com/products/$id");
    try {
      var respon = await http.get(url);
      if(respon.statusCode == 200){
        // konveksi respon ke format map
        var json = jsonDecode(respon.body);
        // konversi menjadi objek Produk
        return Produk.fromMap(json);
      } else{
        int kode = respon.statusCode;
        throw Exception("Error koneksi status :$kode");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }
}