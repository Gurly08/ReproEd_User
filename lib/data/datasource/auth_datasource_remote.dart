import 'package:dartz/dartz.dart';
import 'package:reproeduser/data/model/request/register_request_models.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/variabel.dart';
import '../model/response/auth_response_models.dart';

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModels registerRequestModels) async {
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
}
