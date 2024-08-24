import 'package:flutter/material.dart';
import 'package:reproeduser/pages/home/dashboard.dart';
import 'package:reproeduser/pages/puberrepro/puberreprogirl/pubertas_index.dart';
import 'package:reproeduser/pages/puberrepro/puberreprogirl/reproduksi/reproindex.dart';
import 'package:reproeduser/pages/route/route_context.dart';

import '../../../widgets/theme.dart';
import '../../models/rerpoduksi_models.dart';
import '../../widgets/button_repro.dart';

class ReproduksiListGirl extends StatefulWidget {
  const ReproduksiListGirl({super.key});


  @override
  State<ReproduksiListGirl> createState() => _ReproduksiListGirlState();
}

class _ReproduksiListGirlState extends State<ReproduksiListGirl> {
  late final List<MateriReproduksi> listRepro = dataMateriReproduksiPerempuan;

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
            'PuberReproGirl',
            style: boldBlackTextStyle.copyWith(fontSize: 15),
          ),
          leading: IconButton(
            onPressed: () {
              context.pushReplacement(const Dashboard());
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
                      isSelected: !isPubertasSelected,
                      onSelected: () {
                        setState(() {
                          context.pushReplacement(const PuberReprogirl());
                          isPubertasSelected = true;
                        });
                      },
                      text: 'Pubertas',
                    ),
                    ButtonRepro(
                      isSelected: isPubertasSelected,
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
                  "Materi Pembelajaran Reproduksi",
                  textAlign: TextAlign.center,
                  style: semiboldBlackTextStyle.copyWith(fontSize: 25),
                ),
                Text(
                  "Ayu mulai membaca agar kamu semakin tau!",
                  textAlign: TextAlign.center,
                  style: mediumBlackTextStyle.copyWith(fontSize: 13),
                ),
                const Divider(),
                const SizedBox(height: 20),
                ListView.separated(
                  separatorBuilder: (context, index) => 
                    const SizedBox(height: 18), 
                  itemCount: listRepro.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      context.pushReplacement(RerpoIndexGirl(
                        dataMateri: dataMateriReproduksiPerempuan,
                        selectedMateri: dataMateriReproduksiPerempuan[index],
                      ));
                    },
                    child: Card(
                      color: Colors.pink[500],
                      child: Container(
                        width: double.infinity,
                        height: 100, // Set height for the card
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listRepro[index].judul,
                              style: mediumWhiteTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}