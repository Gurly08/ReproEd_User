import 'package:flutter/material.dart';
import 'package:reproeduser/pages/models/materi_list_models.dart';
import 'package:reproeduser/pages/puberrepro/puberreproman/materi_index.dart';
import 'package:reproeduser/pages/puberrepro/puberreproman/pubertas_index.dart';

import '../../widgets/theme.dart';


class ListMateri extends StatelessWidget {
  const ListMateri({super.key, required this.listMateri});

  final List<Materi> listMateri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PuberReproMan(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
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
                      fontSize: 35, color: Colors.deepPurple),
                ),
              ),
              Text(
                'Bagaimana hari mu, semoga selalu sehat dan semangat belajar selalu ;)',
                style: mediumWhiteTextStyle.copyWith(fontSize: 15),
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
                        builder: (context) => MateriDS(
                          selectedMateri: listMateri[index],
                          listMateri: listMateri, // Mengirimkan listMateri
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 13, 122, 111),
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
