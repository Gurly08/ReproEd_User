import 'package:flutter/material.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';
import 'package:reproeduser/pages/models/test_models.dart';
import 'package:reproeduser/pages/route/route_context.dart';
import 'package:reproeduser/pages/test/answer_test.dart';
import 'package:reproeduser/pages/test/test_pemahaman.dart';

import '../widgets/theme.dart';

class StartTest extends StatelessWidget {
  final Test selectedTest;
  final List<Test> listTest;
  const StartTest({
    super.key,
    required this.selectedTest,
    required this.listTest,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff1E5E62),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            selectedTest.name,
            style: semiboldwhitetext.copyWith(fontSize: 15),
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
                  builder: (context) => TestPemahaman(
                      listTest: listTest), // Mengirimkan listMateri
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          bottom: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Mengerjakan',
                      style: regularBlackTextStyle.copyWith(
                          fontSize: 15, color: Colors.white60),
                    ),
                    Text(
                      'Soal ${selectedTest.name}',
                      style: boldwhitetext.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        Assets.images.starttest.path,
                      ),
                    )
                  ],
                ),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 325),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                      color: Color(0xffFFD365),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kuis saat ini',
                            style: regularBlackTextStyle.copyWith(fontSize: 12),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Test Pemahaman \n${selectedTest.name}',
                            style:
                                semiboldPURPLETextStyle.copyWith(fontSize: 25),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            'Soal ini berisikan sebanyak 20 soal yang akan kamu kerjakan jadi kerjakan dengan terloiti',
                            style: regularBlackTextStyle.copyWith(fontSize: 12),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 75,
                            width: 135,
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                                child: Text(
                              '20',
                              style:
                                  mediumWhiteTextStyle.copyWith(fontSize: 25),
                            )),
                          ),
                          const SizedBox(height: 25 ),
                          Align(
                            child: ElevatedButton(
                              onPressed: () {
                                context.pushReplacement(const AnswerTest());
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  elevation: 8,
                                  shadowColor: Colors.black,
                                  backgroundColor: Colors.purple,
                                  minimumSize: const Size.fromHeight(45)),
                              child: Text(
                                "Masuk",
                                textAlign: TextAlign.center,
                                style:
                                    mediumWhiteTextStyle.copyWith(fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
