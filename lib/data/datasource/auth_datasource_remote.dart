import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:reproeduser/data/datasource/auth_datasource_local.dart';
import 'package:reproeduser/data/model/request/login_request_models.dart';
import 'package:reproeduser/data/model/request/register_request_models.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/variabel.dart';
import '../model/response/auth_response_models.dart';

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModels registerRequestModels) async {
    // ignore: prefer_const_declarations
    final String url = '${Variables.baseUrl}/api/register';
    
    // Logging before sending request
    print('Sending request to: $url');
    print('Request headers: ${{
      'Content-type': 'application/json; charset=UTF-8',
    }}');
    print('Request body: ${registerRequestModels.toJson()}');
    
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: registerRequestModels.toJson(),
    );
    
    // Logging after receiving response
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left('Registrasi Gagal: ${response.body}');
    }
  }

  //logout funsction
  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      return const Right('Yah kamu keluar, aku tunggu kamu kembali ;)');
    } else {
      return const Left('Proses Logout nya gagal :(');
    }
  }

  //login function 
  Future<Either<String, AuthResponseModel>> login(LoginRequestModel data) async {
  final response = await http.post(
    Uri.parse('${Variables.baseUrl}/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(data.toJson()), // Use json.encode to send as a JSON string
  );

  // Logging after receiving response
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return Right(AuthResponseModel.fromJson(response.body));
  } else {
    return const Left('Login kamu gagal, Data Tidak Sesuai');
  }
}

}
