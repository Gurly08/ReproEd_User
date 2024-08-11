import 'package:flutter/material.dart';
import 'package:reproeduser/data/datasource/auth_datasource_local.dart';
import 'package:reproeduser/data/datasource/landingpage_datasource.dart';
import 'package:reproeduser/data/model/response/auth_response_models.dart';
import 'package:reproeduser/pages/auth/login.dart';
import 'package:reproeduser/pages/home/dashboard.dart';

import '../widgets/theme.dart';
import 'landingpage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.push(//delay untuk menampilkan splash
          context,
          MaterialPageRoute(
              builder: (context) => FutureBuilder<AuthResponseModel>(//untuk cek apa user pernah login atau signup
                    future: AuthLocalDatasource().getAuthData(),//get dahulu
                    builder: (context, snapshot) {//mulai pengecekan
                      if (snapshot.hasData) {//jika data user ada 
                        return const Dashboard();//maka akan di direk setelah menampilkan splash ke dashboard/home
                      } else {//jika tidak
                        return FutureBuilder<bool>(//dilakukan pengecekan kedua, dimana jika user sudah melihat LP tetapi belum melakukan login,maka saat membuka kembali aplikasi user akan didirek dari splash ke loginpg, jika baru membuka dan belum melihat LP maka didirek dari splash ke LP
                          future: LandingpageDatasource().getIsFirstTime(),//
                          builder: (context, snapshot) {//mulai penegecekan ke 2
                            if (snapshot.hasData) {//jika data user belum lihat LP
                              return snapshot.data!//maka dipastikan data nya benar ada tidak null
                                ? const Login()//jika ada atau sudah dilihat LP nya maka di direk ke logon
                                : const LandingPage();//jika belum maka di direk ke LP
                            } else {
                              return const LandingPage();//jika baru pertama kali user masuk ke aplikasi maka didirek ke LP
                            }
                          }
                        );
                      }
                    },
                  )
                ),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.blue],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    foregroundImage: AssetImage("assets/images/esgul.png"),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    foregroundImage: AssetImage("assets/images/smp187.jpg"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 225),
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 245),
            Text(
              "V. 1.0.0",
              style: regularwhitetext,
            ),
          ],
        ),
      ),
    );
  }
}
