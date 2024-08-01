import 'package:shared_preferences/shared_preferences.dart';
import 'package:reproeduser/data/model/response/auth_response_models.dart';

class AuthLocalDatasource {
  Future<void> saveAuthData(AuthResponseModels authResponseModels) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', authResponseModels.toJson());
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  Future<AuthResponseModels?> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('auth_data');
    if (authData != null) {
      return AuthResponseModels.fromJson(authData);
    } else {
      return null;
    }
  }
}
