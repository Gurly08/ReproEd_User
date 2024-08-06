import 'package:flutter/material.dart';
import 'package:reproeduser/pages/edukasi/artikel_index.dart';
import 'package:reproeduser/pages/route/route_context.dart';
// import 'package:reproeduser/pages/edukasi/edukasi_video.dart';
// import 'package:reproeduser/pages/route/route_context.dart';
import '../home/home.dart';
import '../models/edukasi_models.dart';
import '../widgets/theme.dart';
import 'edukasi_video.dart';

class EdukasiArtikel extends StatelessWidget {
  const EdukasiArtikel({super.key, required this.listEdukasi});

  final List<Edukasi> listEdukasi;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Edukasi Artikel',
            style: boldBlackTextStyle.copyWith(fontSize: 15),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.teal[600],
                        minimumSize: const Size(115, 25),
                      ),
                      child: Text(
                        'Artikel',
                        style: mediumWhiteTextStyle.copyWith(fontSize: 12),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.pushReplacement(const VideoScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.teal[600],
                        minimumSize: const Size(115, 25),
                      ),
                      child: Text(
                        'Video Edukasi',
                        style: mediumWhiteTextStyle.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 18),
                  itemCount: listEdukasi.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArtikelDS(
                            selectedEdukasi: listEdukasi[index],
                            listEdukasi: listEdukasi,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 13, 122, 111),
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listEdukasi[index].name,
                              style:
                                  mediumWhiteTextStyle.copyWith(fontSize: 16),
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: regularwhitetext.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
