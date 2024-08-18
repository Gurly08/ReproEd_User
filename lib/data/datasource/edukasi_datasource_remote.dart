import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:reproeduser/core/constants/variabel.dart';
import 'package:reproeduser/data/datasource/auth_datasource_local.dart';
import 'package:reproeduser/data/model/response/edukasi_response_models.dart';

class EdukasiRemoteDatasource {
  //get materi by id
  Future<Either<String, EdukasiResponseModel>> getEdukasi() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/get-content-edukasi'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );
    

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      if (jsonResponse.containsKey('edukasi') && jsonResponse['edukasi'] is List && jsonResponse['edukasi'].isNotEmpty) {
        return Right(EdukasiResponseModel.fromJson(jsonResponse));
      } else {
        return const Left('Data edukasi tidak ditemukan atau kosong');
      }
    } else {
      return const Left('Get Edukasi Gagal');
    }

  }
}
