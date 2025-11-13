import 'package:dart_tester/helper/user_helper.dart';
import 'package:dart_tester/model/user.dart';

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
}
