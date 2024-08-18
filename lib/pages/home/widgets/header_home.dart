import 'package:flutter/material.dart';
import 'package:reproeduser/data/datasource/auth_datasource_local.dart';
import 'package:reproeduser/data/model/response/auth_response_models.dart';
import 'package:reproeduser/pages/widgets/theme.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({super.key});

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                child: Image.network(
                  'https://i.pravatar.cc/200',
                  width: 64.0,
                  height: 64.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 208.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    //----------------------------------------------------------
                    Text(
                      'Holla... Selamat Kembali',
                      style: regularwhitetext.copyWith(fontSize: 12,),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 40.0),
          // tambahkan button edit profil
          ElevatedButton(
            onPressed: () {
              // tambahkan logika untuk navigasi ke halaman edit profil
              Navigator.pushNamed(context, '/editProfile');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.purple,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 75.0, vertical: 12.0),
            ),
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
