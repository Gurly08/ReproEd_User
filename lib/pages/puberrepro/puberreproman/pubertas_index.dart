import 'package:flutter/material.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';
import 'package:reproeduser/pages/home/home.dart';
import 'package:reproeduser/pages/models/materi_list_models.dart';
import 'package:reproeduser/pages/puberrepro/puberreproman/list_materi.dart';
import 'package:reproeduser/pages/puberrepro/widgets/card_pubertas.dart';
import 'package:reproeduser/pages/route/route_context.dart';

import '../../widgets/theme.dart';
import '../widgets/button_repro.dart';

class PuberReproMan extends StatefulWidget {
  const PuberReproMan({super.key});

  @override
  State<PuberReproMan> createState() => _PuberReproManState();
}

class _PuberReproManState extends State<PuberReproMan> {
  bool isPubertasSelected = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[400],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'PuberReproMan',
            style: boldwhitetext.copyWith(fontSize: 15),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              context.pushReplacement(const Home());
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
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
                  style: mediumWhiteTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CardPubertas(
                        imagePath: Assets.images.sub1man.path,
                        onPressed: () {
                          context.pushReplacement(ListMateri(
                            listMateri: listMateri,
                          ));
                        },
                        subtitle: 'Sub Materi 1',
                        title: 'Definisi Pubertas',
                      ),
                      const SizedBox(width: 22),
                      CardPubertas(
                        imagePath: Assets.images.sub2man.path,
                        onPressed: () {
                          context.pushReplacement(ListMateri(
                            listMateri: listMateri,
                          ));
                        },
                        subtitle: 'Sub Materi 2',
                        title: 'Tahapan Pubertas',
                      ),
                      const SizedBox(width: 22),
                      CardPubertas(
                        imagePath: Assets.images.sub3man.path,
                        onPressed: () {
                          context.pushReplacement(ListMateri(
                            listMateri: listMateri,
                          ));
                        },
                        subtitle: 'Sub Materi 3',
                        title: 'Pertemeanan di Masa Pubertas',
                      ),
                      const SizedBox(width: 22),
                      CardPubertas(
                        imagePath: Assets.images.sub4man.path,
                        onPressed: () {
                          context.pushReplacement(ListMateri(
                            listMateri: listMateri,
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
