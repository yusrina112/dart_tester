import 'package:dart_tester/helper/user_helper.dart';
import 'package:dart_tester/model/user.dart';
import 'package:dart_tester/helper/produk_helper.dart';
import 'package:dart_tester/model/produkt.dart'; 
import 'package:dart_tester/helper/cart_helper.dart';
import 'package:dart_tester/model/cart.dart';
import 'package:dart_tester/model/cart_produk.dart';

void main(List<String> arguments) async {
  print("Sedang mengambil data...");

List<dynamic> coba = await UserHelper().getAllUser();
print(coba);

  // membuat objek untuk menampung data user
  User pengguna = await UserHelper().getUserById(2);
  print(pengguna.username);
  print("Email :${pengguna.email}");

  // Membuat user baru
  User p = User(
    id: 10, 
    username: "mawar", 
    email: "mawar@gmail.com", 
    password: "1234",
  );
  // Kirim data ke endpoint
  int idUserBaru = await UserHelper().createUser(p);
  print("id user yang baru dibuat :$idUserBaru");

  // mengupdate user baru
  User up = User(
    id: 2, 
    username: "melati", 
    email: "melati@gmail.com", 
    password: "9876",
  );
  // Simpan hasil respon
  User hasil = await UserHelper().updateUser(up);
  print("Ini hasil update : $hasil");

  // 1. Ambil semua produk
  print("Sedang mengambil data...");
  List<dynamic> getAllProduk = await ProdukHelper().getAllProduk();
  print(getAllProduk);

  // 2. Ambil product berdasarkan ID
  Produk produkById = await ProdukHelper().getProdukById(1);
  print("Nama produk :${produkById.title}");

  // 3. Membuat produk baru
  Produk newProduct = Produk(id: 12, title: "Nabati", description: "Wafer dengan taburan selai cokelat", price: 5000, category: "food", image: "no image");
  int produkBaru = await ProdukHelper().createProduk(newProduct);
  print("id produk baru yang dibuat : $produkBaru");

  // 4. Mengupdate data produk baru
  Produk updateProduct = Produk(id: 120, title: "Nabati", description: "Wafer dengan taburan selai cokelat", price: 5000, category: "food", image: "no image");

  // Simpan hasil respon
  Produk result = await ProdukHelper().updateProduk(updateProduct);
  print("Ini hasil update : $result");

  // Tambah Cart Baru
  List<CartProduk> produkToBuy = [
    CartProduk(productId: 5, quantity: 6),
    CartProduk(productId: 12, quantity: 5),
  ];
  Cart newCart = Cart(id: 1, userId: 5, products: produkToBuy);
  int cartBaru = await CartHelper().createCart(newCart);
  print("id cart baru yang dibuat : $cartBaru");

  // Mengambil Cart berdasarkan ID
  Cart cartById = await CartHelper().getCartById(2);
  print("Cart ID ${cartById.id} : ${cartById.products}");

  // Mengupdate Data Cart 
  //Membuat list CartProduk yang akan di isi
  List<CartProduk> produkToUpdate = [
    CartProduk(productId: 5, quantity: 20),
    CartProduk(productId: 12, quantity: 60),
  ];
  Cart updateCart = Cart(id: 1, userId: 5, products: produkToUpdate);
  Cart update = await CartHelper().updateCart(updateCart);
  print("Ini Hasil update : $update");

}
