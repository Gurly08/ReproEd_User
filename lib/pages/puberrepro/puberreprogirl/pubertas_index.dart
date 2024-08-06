import 'package:flutter/material.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';
import 'package:reproeduser/pages/home/home.dart';
import 'package:reproeduser/pages/models/materi_list_models.dart';
import 'package:reproeduser/pages/puberrepro/puberreprogirl/list_materigirl.dart';
import 'package:reproeduser/pages/puberrepro/widgets/card_pubertasgirl.dart';
import 'package:reproeduser/pages/route/route_context.dart';


import '../../widgets/theme.dart';
import '../widgets/button_repro.dart';

class PuberReprogirl extends StatefulWidget {
  const PuberReprogirl({super.key});

  @override
  State<PuberReprogirl> createState() => _PuberReprogirlState();
}

class _PuberReprogirlState extends State<PuberReprogirl> {
  bool isPubertasSelected = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'PuberReprogirl',
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
              context.pushReplacement(const Home());
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonRepro(
                      isSelected: isPubertasSelected,
                      onSelected: () {
                        setState(() {
                          isPubertasSelected = true;
                        });
                      },
                      text: 'Pubertas',
                    ),
                    ButtonRepro(
                      isSelected: !isPubertasSelected,
                      onSelected: () {
                        setState(() {
                          isPubertasSelected = false;
                        });
                      },
                      text: 'Reproduksi',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Materi Pembelajaran Pubertas",
                  textAlign: TextAlign.center,
                  style: semiboldBlackTextStyle.copyWith(fontSize: 25),
                ),
                Text(
                  "Ayu mulai membaca agar kamu semakin tau!",
                  textAlign: TextAlign.center,
                  style: mediumBlackTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CardPubertasgirl(
                        imagePath: Assets.images.subpubergirl1.path,
                        onPressed: () {
                          context.pushReplacement(ListMaterigirl(
                            listMateri:
                                listMateri, // Pastikan `listMateri` sudah terdefinisi dan di-passing ke sini
                          ));
                        },
                        subtitle: 'Sub Materi 1',
                        title: 'Definisi Pubertas',
                      ),
                      const SizedBox(width: 22),
                      CardPubertasgirl(
                        imagePath: Assets.images.subpubergirl2.path,
                        onPressed: () {
                          context.pushReplacement(ListMaterigirl(
                            listMateri:
                                listMateri, // Pastikan `listMateri` sudah terdefinisi dan di-passing ke sini
                          ));
                        },
                        subtitle: 'Sub Materi 2',
                        title: 'Tahapan Pubertas',
                      ),
                      const SizedBox(width: 22),
                      CardPubertasgirl(
                        imagePath: Assets.images.subpubergirl3.path,
                        onPressed: () {
                          context.pushReplacement(ListMaterigirl(
                            listMateri: listMateri,
                          ));
                        },
                        subtitle: 'Sub Materi 3',
                        title: 'Pertemeanan di Masa Pubertas',
                      ),
                      const SizedBox(width: 22),
                      CardPubertasgirl(
                        imagePath: Assets.images.subpubergirl4.path,
                        onPressed: () {
                          context.pushReplacement(ListMaterigirl(
                            listMateri:
                                listMateri, // Pastikan `listMateri` sudah terdefinisi dan di-passing ke sini
                          ));
                        },
                        subtitle: 'Sub Materi 4',
                        title: 'Perlukah Edukasi ?',
                      ),
                    ],
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
