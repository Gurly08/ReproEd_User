import 'package:flutter/material.dart';
import 'package:reproeduser/data/model/response/edukasi_response_models.dart';
import 'package:reproeduser/pages/edukasi/edukasi_artikel.dart';
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
    // Validasi data sebelum render UI
    // ignore: unnecessary_null_comparison
    if (widget.listEdukasi.isEmpty || widget.selectedEdukasi == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Data Tidak Tersedia',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: const Center(
          child: Text('Data edukasi tidak tersedia.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.selectedEdukasi.judulEdukasi,
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
                          'Artikel ${widget.selectedEdukasi.judulEdukasi} \n Selamat Membaca ;)',
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
                  widget.selectedEdukasi.judulEdukasi,
                  maxLines: 3,
                  style: mediumPURPLETextStyle.copyWith(fontSize: 18),
                ),
              ),
              const Divider(),
              const SizedBox(height: 12),
              Image.asset(Assets.images.dna.path),
              const SizedBox(height: 20),
              Text(
                'Artikel ini menjelaskan perubahan fisik dan emosional yang terjadi pada remaja selama masa pubertas. Perubahan fisik meliputi pertumbuhan tinggi badan, perkembangan payudara pada perempuan, perubahan suara pada laki-laki, dan pertumbuhan rambut di area tubuh tertentu. Selain itu, hormon yang berubah selama masa pubertas dapat menyebabkan perubahan suasana hati. Artikel ini memberikan saran bagi remaja untuk menerima perubahan ini sebagai bagian normal dari pertumbuhan dan menawarkan tips untuk menjaga kesehatan dan kebersihan diri selama masa pubertas.',
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Text(
                'Ini mencakup cara berbicara dengan anak tentang perubahan fisik dan emosional yang mereka alami, memberikan penjelasan yang jujur dan ilmiah tentang apa yang sedang terjadi, dan menciptakan lingkungan yang aman dan mendukung di rumah. Artikel ini juga menekankan pentingnya komunikasi terbuka antara orang tua dan anak untuk membantu anak merasa lebih nyaman dan tidak malu dengan perubahan yang terjadi pada tubuh mereka.',
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Image.asset(Assets.images.assetpubergirl2.path),
              const SizedBox(height: 20),
              Text(
                'bagaimana remaja dapat mengelola perubahan emosional yang terjadi selama masa pubertas, yang seringkali disebabkan oleh perubahan hormonal. Artikel ini mencakup strategi untuk mengelola stres, kecemasan, dan perasaan lainnya yang mungkin muncul, seperti berolahraga secara teratur, menjaga pola tidur yang sehat, dan mencari waktu untuk relaksasi. Artikel ini juga menekankan pentingnya berbicara dengan orang dewasa yang dipercaya jika emosi menjadi terlalu berat untuk ditangani sendiri.',
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Image.asset(Assets.images.assetpubergirl3.path),
              const SizedBox(height: 20),
              Text(
                ' Ini mencakup tips bagi orang tua tentang bagaimana memulai percakapan tentang pubertas, seksualitas, dan kesehatan reproduksi dengan cara yang nyaman dan terbuka. Artikel ini juga memberikan saran tentang bagaimana orang tua dapat menjadi sumber informasi yang dapat dipercaya bagi anak-anak mereka, serta bagaimana menjawab pertanyaan anak dengan cara yang sesuai dengan usia mereka.',
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
