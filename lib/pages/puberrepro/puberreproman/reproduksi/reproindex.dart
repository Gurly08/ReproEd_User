import 'package:flutter/material.dart';
import 'package:reproeduser/pages/puberrepro/puberreproman/reproduksi/reproduksi_listman.dart';

import '../../../widgets/theme.dart';
import '../../models/rerpoduksi_models.dart';

class RerpoIndexMan extends StatefulWidget {
  final MateriReproduksi selectedMateri;
  final List<MateriReproduksi> dataMateri;
  const RerpoIndexMan({
    super.key,
    required this.selectedMateri,
    required this.dataMateri,
  });

  @override
  State<RerpoIndexMan> createState() => _RerpoIndexManState();
}

class _RerpoIndexManState extends State<RerpoIndexMan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.selectedMateri.judul,
          style: semiboldBlackTextStyle.copyWith(fontSize: 15),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ReproduksiList(), // Mengirimkan listMateri
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
                            '${widget.selectedMateri.judul} \n Selamat Membaca ;)',
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 20),
              Image.asset(widget.selectedMateri.imagesone),
              const SizedBox(height: 20),
              Text(
                widget.selectedMateri.paragrafone,
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Image.asset(widget.selectedMateri.imagestwo),
              Image.asset(widget.selectedMateri.imagesthree),
              const SizedBox(height: 20),
              Text(
                widget.selectedMateri.paragratwo,
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Image.asset(widget.selectedMateri.imagestfour),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}