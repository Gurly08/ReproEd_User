import 'dart:convert';

class RegisterRequestModels {
    final String name;
    final String email;
    final String kelas;
    final String umur;
    final String jenisKelamin;
    final String password;

    RegisterRequestModels({
        required this.name,
        required this.email,
        required this.kelas,
        required this.umur,
        required this.jenisKelamin,
        required this.password,
    });

    factory RegisterRequestModels.fromJson(String str) => RegisterRequestModels.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterRequestModels.fromMap(Map<String, dynamic> json) => RegisterRequestModels(
        name: json["name"],
        email: json["email"],
        kelas: json["kelas"],
        umur: json["umur"],
        jenisKelamin: json["jenis_kelamin"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "kelas": kelas,
        "umur": umur,
        "jenis_kelamin": jenisKelamin,
        "password": password,
    };
}
