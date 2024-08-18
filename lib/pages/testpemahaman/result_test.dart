import 'package:flutter/material.dart';
import 'package:reproeduser/core/extentions/build_context_ext.dart';
import 'package:reproeduser/pages/home/dashboard.dart';
import 'package:reproeduser/pages/testpemahaman/widgets/test_avaible_card.dart';
import 'package:reproeduser/pages/testpemahaman/widgets/test_result_last.dart';

import '../widgets/buttons.dart';
import '../widgets/color.dart';
import '../widgets/custom_scaffold.dart';
import 'models/test_pemahaman_model.dart';

class ResultTest extends StatelessWidget {
  const ResultTest({super.key});

  @override
  Widget build(BuildContext context) {
    const paddingHorizontalSize = 16.0;
    const paddingHorizontal =EdgeInsets.symmetric(horizontal: paddingHorizontalSize);
    final List<QuizModel> datas = [
      QuizModel(
        name: 'Kesehatan Reproduksi',
        type: 'Multiple Choice',
        description:
            'Soal ini menguji pengetahuan tentang kesehatan reproduksi, termasuk fungsi tubuh, pencegahan penyakit, dan perencanaan keluarga.',
        duration: 30,
        kategori: 'kesehatan_reproduksi',
      ),
      QuizModel(
        name: 'Penyebab Kehamilan',
        type: 'Multiple Choice',
        description:
            'Soal ini menguji pengetahuan tentang bagaimana kehamilan terjadi, termasuk hubungan antara sel telur dan sperma.',
        duration: 30,
        kategori: 'penyebab_kehamilan',
      ),
      QuizModel(
        name: 'Perubahan Emosi',
        type: 'Multiple Choice',
        description:
            'Soal ini membahas perubahan emosi selama masa remaja, seperti suasana hati yang berubah-ubah.',
        duration: 30,
        kategori: 'perubahan_emosi',
      ),
    ];

    return CustomScaffold(
      appBarTitle: const Text('Hasil Tes'),
      body: ListView(
        children: [
          const SizedBox(height: 30.0),
          const Padding(
            padding: paddingHorizontal,
            child: TestResultLast(),
          ),
          const SizedBox(height: 40.0),
          const Padding(
            padding: paddingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tes yang Tersedia',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontalSize - 8.0),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: datas
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TestAvaibleCard(data: item),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(16.0),
        child: Button.filled(
          onPressed: () => context.pushReplacement(const Dashboard()),
          label: 'Kembali ke Beranda',
        ),
      ),
    );
  }
}