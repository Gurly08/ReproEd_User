import 'package:flutter/material.dart';
import 'package:reproeduser/pages/models/materi_list_models.dart';
import 'package:reproeduser/pages/puberrepro/puberreprogirl/materi_index.dart';
import 'package:reproeduser/pages/puberrepro/puberreprogirl/pubertas_index.dart';

import '../../widgets/theme.dart';


// ignore: must_be_immutable
class ListMaterigirl extends StatelessWidget {
  ListMaterigirl({super.key, required this.listMateri});

  List<Materi> listMateri = [
    Materi(name: "Definisi Pubertas"),
    Materi(name: "Tahapan Pubertas"),
    Materi(name: "Pertemeanan di Masa Pubertas"),
    Materi(name: "Perlukah Edukasi ?"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'PuberReproMan',
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
              MaterialPageRoute(
                builder: (context) => const PuberReprogirl(),
              ),
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Definisi Pubertas',
                  style: semiboldPURPLETextStyle.copyWith(
                      fontSize: 35, color: Colors.purple),
                ),
              ),
              Text(
                'Bagaimana hari mu, semoga selalu sehat dan semangat belajar selalu ;)',
                style: mediumBlackTextStyle.copyWith(fontSize: 15),
              ),
              const Divider(),
              const SizedBox(height: 22),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 18),
                itemCount: listMateri.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MateriDSgirl(
                          selectedMateri: listMateri[index],
                          listMateri: listMateri, // Mengirimkan listMateri
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.pink[500],
                    child: Container(
                      width: double.infinity,
                      height: 80, // Set height for the card
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listMateri[index].name,
                            style: mediumWhiteTextStyle.copyWith(fontSize: 16),
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
    );
  }
}
