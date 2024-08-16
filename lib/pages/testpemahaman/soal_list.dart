import 'package:flutter/material.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';
import 'package:reproeduser/pages/home/dashboard.dart';
import 'package:reproeduser/pages/testpemahaman/models/test_pemahaman_model.dart';
import 'package:reproeduser/pages/testpemahaman/widgets/info_karaktaku.dart';
import 'package:reproeduser/pages/testpemahaman/widgets/test_card.dart';
import '../widgets/theme.dart';

class TestPemahaman extends StatelessWidget {
  const TestPemahaman({super.key});

  @override
  Widget build(BuildContext context) {
    final List<QuizModel> datas = [
      QuizModel(
        name: 'Kesehatan Reproduksi', 
        type: 'Multiple Choice', 
        description: 
        'Soal ini menguji pengetahuan tentang kesehatan reproduksi, termasuk fungsi tubuh, pencegahan penyakit, dan perencanaan keluarga.', 
        duration: 30,
      ),
      QuizModel(
        name: 'Penyebab Kehamilan', 
        type: 'Multiple Choice', 
        description: 
        'Soal ini menguji pengetahuan tentang bagaimana kehamilan terjadi, termasuk hubungan antara sel telur dan sperma.', 
        duration: 30,
      ),
      QuizModel(
        name: 'Perubahan Emosi', 
        type: 'Multiple Choice', 
        description: 
        'Soal ini membahas perubahan emosi selama masa remaja, seperti suasana hati yang berubah-ubah.', 
        duration: 30,
      ),

    ];
    return Scaffold(
      backgroundColor: const Color(0xff1E5E62),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Karaktaku',
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
                builder: (context) => const Dashboard(),
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
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const InfoKaraktaku(),
              const SizedBox(height: 18),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selamat Datang \nTest \nPemahaman',
                    style: mediumWhiteTextStyle.copyWith(fontSize: 20),
                  ),
                  Image.asset(
                    Assets.images.rbkaraktaku.path,
                    width: 120,
                    height: 145,
                  )
                ],
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 18),
                itemCount: datas.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => QuizCard(data: datas[index]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
