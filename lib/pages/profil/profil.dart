import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reproeduser/pages/auth/bloc/logout/logout_bloc.dart';
import 'package:reproeduser/pages/auth/login.dart';
import 'package:reproeduser/pages/route/route_context.dart';

import '../../data/datasource/auth_datasource_local.dart';
import '../../data/model/response/auth_response_models.dart';
import '../models/layanan_models.dart';
import '../widgets/theme.dart';
import 'edit_profil.dart';
import 'widgets/card_profil.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: darkblue,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/images/ppaku.jpg',
                          )),
                      const SizedBox(height: 25),
                      //untuk menmapilkan username yang sesuai dengan nama user yang regis atau login
                    FutureBuilder<AuthResponseModel>(
                      future: AuthLocalDatasource().getAuthData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.user.name,
                            style: mediumWhiteTextStyle.copyWith(fontSize: 20),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }
                    ),
                      const SizedBox(height: 8),
                      Text(
                        'Siswa Kelas 9',
                        style: mediumWhiteTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 270),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(65)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          const SizedBox(height: 46),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EditProfil(),
                                  ));
                            },
                            child: CardProfil(
                              layanan: Layanan(
                                  id: 4,
                                  imageUrl: 'assets/images/Person.png',
                                  name: 'Edit Profil',
                                  color: Colors.yellow[200]),
                            ),
                          ),
                          const SizedBox(height: 18),
                          InkWell(
                            onTap: () {},
                            child: CardProfil(
                              layanan: Layanan(
                                id: 5,
                                imageUrl: 'assets/images/latter.png',
                                name: 'Tentang Aplikasi',
                                color: Colors.blue[300],
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          InkWell(
                            onTap: () {
                              //proses logout
                              context.read<LogoutBloc>().add(const LogoutEvent.logout());
                              AuthLocalDatasource().removeAuthData();
                              context.pushReplacement(const Login());
                            },
                            child: CardProfil(
                              layanan: Layanan(
                                  id: 4,
                                  imageUrl: 'assets/images/Logout.png',
                                  name: 'Keluar',
                                  color: Colors.red[100]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
