import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';
import 'package:reproeduser/pages/home/dashboard.dart';
import 'package:reproeduser/pages/testpemahaman/bloc/createujian/create_ujian_bloc.dart';
import 'package:reproeduser/pages/testpemahaman/bloc/ujianbykategori/ujian_by_kategori_bloc.dart';
import 'package:reproeduser/pages/testpemahaman/models/test_pemahaman_model.dart';
import 'package:reproeduser/pages/testpemahaman/widgets/info_karaktaku.dart';
import 'package:reproeduser/pages/testpemahaman/widgets/test_card.dart';
import '../widgets/theme.dart';

class TestPemahaman extends StatefulWidget {
  const TestPemahaman({super.key});

  @override
  State<TestPemahaman> createState() => _TestPemahamanState();
}

class _TestPemahamanState extends State<TestPemahaman> {
  @override
  void initState() {
    context.read<UjianByKategoriBloc>().add(
        const UjianByKategoriEvent.getUjianByKategori('penyebab_kehamilan'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      backgroundColor: const Color(0xff1E5E62),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Karaktaku',
          style: boldwhitetext.copyWith(fontSize: 15),
        ),
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
              BlocListener<UjianByKategoriBloc, UjianByKategoriState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    notFound: () {
                      context
                          .read<CreateUjianBloc>()
                          .add(const CreateUjianEvent.createUjian());
                    },
                  );
                },
                child: BlocBuilder<UjianByKategoriBloc, UjianByKategoriState>(
                  builder: (context, state) {
                    return state.maybeWhen(orElse: () {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      );
                    }, success: (data) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 18),
                        itemCount: datas.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            QuizCard(data: datas[index]),
                      );
                    }, notFound: () {
                      return BlocBuilder<CreateUjianBloc, CreateUjianState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.amber,
                                ),
                              );
                            },
                            success: () {
                              return ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 18),
                                itemCount: datas.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    QuizCard(data: datas[index]),
                              );
                            },
                          );
                        },
                      );
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
