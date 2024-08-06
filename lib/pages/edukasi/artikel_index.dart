import 'package:flutter/material.dart';
import 'package:reproeduser/pages/edukasi/edukasi_artikel.dart';
import 'package:reproeduser/pages/models/edukasi_models.dart';
import '../../core/assets/assets.gen.dart';
import '../widgets/theme.dart';

class ArtikelDS extends StatefulWidget {
  final Edukasi selectedEdukasi;
  final List<Edukasi> listEdukasi;

  const ArtikelDS({
    super.key,
    required this.selectedEdukasi,
    required this.listEdukasi,
  });

  @override
  State<ArtikelDS> createState() => _ArtikelDSState();
}

class _ArtikelDSState extends State<ArtikelDS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.selectedEdukasi.name,
          style: semiboldBlackTextStyle.copyWith(fontSize: 15),
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
                builder: (context) =>
                    EdukasiArtikel(listEdukasi: widget.listEdukasi),
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
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 35),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  color: Colors.tealAccent,
                  height: 110,
                  child: Row(
                    children: [
                      const Icon(Icons.book_rounded),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          style: semiboldBlackTextStyle.copyWith(fontSize: 15),
                          'Artikel ${widget.selectedEdukasi.name} \n Selamat Membaca ;)',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Minggu, 04/08/2024',
                  style: regularBlackTextStyle.copyWith(fontSize: 10),
                  textAlign: TextAlign.justify,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Artikel \nPertama \nEdukasi',
                  style: mediumPURPLETextStyle.copyWith(fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ),
              const Divider(),
              const SizedBox(height: 12),
              Image.asset(Assets.images.dna.path),
              const SizedBox(height: 20),
              Text(
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui p ex ea commodo  con',
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Text(
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui p ex ea commodo  con, Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui p ex ea commodo  con',
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Image.asset(Assets.images.assetpubergirl2.path),
              const SizedBox(height: 20),
              Text(
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui p ex ea commodo  con',
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Image.asset(Assets.images.assetpubergirl3.path),
              const SizedBox(height: 20),
              Text(
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui p ex ea commodo  con, Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliqui p ex ea commodo  con',
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
