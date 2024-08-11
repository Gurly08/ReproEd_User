import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reproeduser/pages/edukasi/artikel_index.dart';
import 'package:reproeduser/pages/home/dashboard.dart';
import 'package:reproeduser/pages/route/route_context.dart';
import '../../data/model/response/edukasi_response_models.dart';
import '../bloc/edukasi/edukasi_bloc.dart';
import '../widgets/theme.dart';
import 'edukasi_video.dart';

class EdukasiArtikel extends StatefulWidget {
  const EdukasiArtikel({super.key, required this.listEdukasi});

  final List<Edukasi> listEdukasi;

  @override
  State<EdukasiArtikel> createState() => _EdukasiArtikelState();
}

class _EdukasiArtikelState extends State<EdukasiArtikel> {
  //untuk meng gate 1 bloc
  @override
  void initState() {
    context.read<EdukasiBloc>().add(const EdukasiEvent.getEdukasi());
    super.initState();
  }

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
                MaterialPageRoute(builder: (context) => const Dashboard()),
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
                BlocBuilder<EdukasiBloc, EdukasiState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: (){
                        return const Center(child: Text('ErrorTidak Ada Materi'),);
                      },
                      loading: () => const Center(child: CircularProgressIndicator(),),
                      success: (data){
                        if (data.edukasi.isEmpty) {
                          return const Center(child: Text('Tidak ada edukasi tersedia'));
                        }
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 18),
                          itemCount: data.edukasi.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArtikelDS(
                                    selectedEdukasi: data.edukasi[index],
                                    listEdukasi: data.edukasi,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: const Color.fromARGB(255, 13, 122, 111),
                              child: Container(
                                width: double.infinity,
                                height: 185,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.edukasi[index].judulEdukasi, 
                                      style: mediumWhiteTextStyle.copyWith(fontSize: 15),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      style:
                                          regularwhitetext.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
