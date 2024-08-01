import 'package:dartz/dartz.dart';
import 'package:reproeduser/data/model/request/register_request_models.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/variabel.dart';
import '../model/response/auth_response_models.dart';

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModels>> register(
      RegisterRequestModels registerRequestModels) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/register'),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: registerRequestModels.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModels.fromJson(response.body));
    } else {
      return const Left('Registrasi Gagal');
    }
  }
}
