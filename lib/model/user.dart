import 'dart:convert';

class User {
  final int id;
  final String username;
  final String email;
  final String password;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  // constructor, conversi dari atau ke json

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.id == id &&
      other.username == username &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      username.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}
