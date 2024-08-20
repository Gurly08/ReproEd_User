import 'dart:convert';

class ResultResponModels {
    final String message;
    final int totalbenar;
    final int totalsalah;
    final int totalsoal;

    ResultResponModels({
        required this.message,
        required this.totalbenar,
        required this.totalsalah,
        required this.totalsoal,
    });

    factory ResultResponModels.fromJson(String str) => ResultResponModels.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResultResponModels.fromMap(Map<String, dynamic> json) => ResultResponModels(
        message: json["message"],
        totalbenar: json["totalbenar"],
        totalsalah: json["totalsalah"],
        totalsoal: json["totalsoal"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "totalbenar": totalbenar,
        "totalsalah": totalsalah,
        "totalsoal": totalsoal,
    };
}
