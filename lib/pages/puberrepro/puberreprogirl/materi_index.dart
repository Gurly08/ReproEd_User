import 'package:flutter/material.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';
import 'package:reproeduser/pages/models/materi_list_models.dart';
import 'package:reproeduser/pages/puberrepro/puberreprogirl/list_materigirl.dart';

import '../../widgets/theme.dart';


class MateriDSgirl extends StatefulWidget {
  final Materi selectedMateri;
  final List<Materi> listMateri; // Menambahkan parameter listMateri

  const MateriDSgirl(
      {super.key, required this.selectedMateri, required this.listMateri});

  @override
  // ignore: library_private_types_in_public_api
  _MateriDSgirlState createState() => _MateriDSgirlState();
}

class _MateriDSgirlState extends State<MateriDSgirl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.selectedMateri.name,
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
                builder: (context) => ListMaterigirl(
                    listMateri: widget.listMateri), // Mengirimkan listMateri
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 15),
                    color: Colors.tealAccent,
                    height: 110,
                    child: Row(
                      children: [
                        const Icon(Icons.book_rounded),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            style:
                                semiboldBlackTextStyle.copyWith(fontSize: 15),
                            '${widget.selectedMateri.name} \n Selamat Membaca ;)',
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 20),
              Image.asset(Assets.images.assetpubergirl1.path),
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
              const SizedBox(height: 15),
              Image.asset(Assets.images.assetpubergirl4.path),
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
