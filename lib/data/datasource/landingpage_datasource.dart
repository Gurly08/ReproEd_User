import 'package:shared_preferences/shared_preferences.dart';

class LandingpageDatasource{
  Future<void> saveLandingpagePassed() async{
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('is_first_time', true);
  }

  //future bool ini untuk cek apakah landingpage sudah pernah dilihat atau belum
  Future<bool> getIsFirstTime() async{
    final pref = await SharedPreferences.getInstance();
    final isFirstTime = pref.getBool('is_first_time');

    return isFirstTime ?? false;
  }
}

//landing page data source ini berfungsi untuk mengatur tampilan yang hanya didapatkan sekali, Kapan?
//yaitu saat user pertama kali install aplikasi reproed, dan belum login atau sign up aplikasi