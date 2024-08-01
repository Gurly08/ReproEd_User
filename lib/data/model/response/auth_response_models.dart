import 'package:meta/meta.dart';
import 'dart:convert';

class AuthResponseModels {
  final String accessToken;
  final User user;

  AuthResponseModels({
    required this.accessToken,
    required this.user,
  });

  factory AuthResponseModels.fromJson(String str) =>
      AuthResponseModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModels.fromMap(Map<String, dynamic> json) =>
      AuthResponseModels(
        accessToken: json["access_token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "user": user.toMap(),
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String roles;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.roles,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        roles: json["roles"] ?? '-',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "roles": roles,
      };
}
