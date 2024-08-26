import 'package:flutter/material.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';
import 'package:reproeduser/pages/profil/profil.dart';

import '../widgets/theme.dart';

class TentangAplikasi extends StatelessWidget {
  const TentangAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text( 'Tentang Aplikasi',
          style: semiboldBlackTextStyle.copyWith(fontSize: 15),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Profil(), // Mengirimkan listMateri
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 35),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(Assets.images.logo.path),
              const SizedBox(height: 20),
              Text( 'ReproEd adalah platform edukasi mobile berbasis Android yang dirancang khusus untuk memudahkan siswa mempelajari topik reproduksi secara mendalam. Dengan menggunakan framework Flutter, ReproEd menawarkan pengalaman belajar yang interaktif, informatif, dan mudah diakses kapan saja. Dapatkan pengetahuan lengkap seputar reproduksi dengan berbagai fitur menarik yang mendukung pembelajaran siswa secara efektif. Ayo, eksplorasi dunia pengetahuan reproduksi dengan ReproEd dan jadilah lebih siap untuk masa depanmu!',
                style: regularBlackTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
    );
  }
}