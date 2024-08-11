import 'dart:convert';

class EdukasiResponseModel {
  final List<Edukasi> edukasi;

  EdukasiResponseModel({
    required this.edukasi,
  });

  factory EdukasiResponseModel.fromRawJson(String str) => EdukasiResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EdukasiResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['edukasi'] != null && json['edukasi'] is List && json['edukasi'].isNotEmpty) {
      return EdukasiResponseModel(
        edukasi: List<Edukasi>.from(json['edukasi'].map((x) => Edukasi.fromJson(x))),
      );
    } else {
      throw Exception('Data edukasi tidak valid atau kosong');
    }
  }

  Map<String, dynamic> toJson() => {
        'edukasi': List<dynamic>.from(edukasi.map((x) => x.toJson())),
      };
}

class Edukasi {
  final int id;
  final String judulEdukasi;
  final String deskripsiEdukasi;
  final String gambar;
  final String videoEdukasi;
  final DateTime createdAt;
  final DateTime updatedAt;

  Edukasi({
    required this.id,
    required this.judulEdukasi,
    required this.deskripsiEdukasi,
    required this.gambar,
    required this.videoEdukasi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Edukasi.fromRawJson(String str) => Edukasi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Edukasi.fromJson(Map<String, dynamic> json) {
    return Edukasi(
      id: json['id'],
      judulEdukasi: json['judul_edukasi'],
      deskripsiEdukasi: json['deskripsi_edukasi'],
      gambar: json['gambar'],
      videoEdukasi: json['video_edukasi'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'judul_edukasi': judulEdukasi,
        'deskripsi_edukasi': deskripsiEdukasi,
        'gambar': gambar,
        'video_edukasi': videoEdukasi,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
