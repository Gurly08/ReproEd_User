import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:reproeduser/data/model/response/result_response_models.dart';
import 'package:reproeduser/data/model/response/ujian_response_models.dart';
import '../../core/constants/variabel.dart';
import 'auth_datasource_local.dart';

class UjianRemoteDatasource{
  Future<Either<String, UjianResponseModel>> getUjianByKategori(
    String kategori) async{
    final authData = await AuthLocalDatasource().getAuthData();
    final response =await http.get(
      Uri.parse('${Variables.baseUrl}/api/get-soal-ujian?kategori=$kategori'),
      headers: <String, String>{
        'Content-Type': 'application/json; chartset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(UjianResponseModel.fromJson(response.body));   
    } else {
      return const Left('get ujian gagal');
    }
  }

  Future<Either<String, String>> createUjian() async{
    final authData = await AuthLocalDatasource().getAuthData();
    final response =await http.post(
      Uri.parse('${Variables.baseUrl}/api/create-ujian'),
      headers: <String, String>{
        'Content-Type': 'application/json; chartset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return const Right('Create Ujian Berhasil :)');   
    } else {
      return const Left('get ujian gagal');
    }
  }

  Future<Either<String, String>> answer(int soalId, String jawaban) async{
    final authData = await AuthLocalDatasource().getAuthData();
    final body = {
      'soal_id': soalId,
      'jawaban': jawaban,
    };
    final response =await http.post(
      Uri.parse('${Variables.baseUrl}/api/answers'),
      headers: <String, String>{
        'Content-Type': 'application/json; chartset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return const Right('answer berhasil');   
    } else {
      return const Left('answer gagal');
    }
  }

  Future<Either<String, String>> hitungNilai(String kategori) async{
    final authData = await AuthLocalDatasource().getAuthData();
    final response =await http.get(
      Uri.parse('${Variables.baseUrl}/api/get-nilai?kategori=$kategori'),
      headers: <String, String>{
        'Content-Type': 'application/json; chartset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return const Right('hitung nilai berhasil');   
    } else {
      return const Left('hitung nilai gagal');
    }
  }

  Future<Either<String, ResultResponModels>> resultTest() async{
    final authData = await AuthLocalDatasource().getAuthData();
    // print('kategori: $kategori');
    final response =await http.get(
      Uri.parse('${Variables.baseUrl}/api/get-result'),
      headers: <String, String>{
        'Content-Type': 'application/json; chartset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return Right(ResultResponModels.fromJson(response.body));   
    } else {
      return const Left('hitung nilai gagal');
    }
  }
}