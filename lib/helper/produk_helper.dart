import 'package:http/http.dart' as http;
import 'dart:convert';

// function untuk mengambil data produk dari API
Future<void> ambilProduk() async{
  // siapkan endpoint (url)
  var alamat = Uri.parse("https://fakestoreapi.com/products/4");

  print("Sedang mengambil data...");
  // bungkus dengan error handling
  try{
    // blok perintah yang dicoba jalankan
    // jika error lempar ke catch
    var respon = await http.get(alamat);
    if(respon.statusCode == 200) {
      print("Ada respon dari server");
      var hasil = jsonDecode(respon.body);
      print(hasil["price"]);
    } else {
      print("Tidak ada respon");
    }
  }catch(e){
    print('Gagal : $e');
  }
}
void main(List<String> arguments) {
  ambilProduk();
}
