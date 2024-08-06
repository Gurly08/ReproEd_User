import 'package:flutter/material.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';
import 'package:reproeduser/pages/home/home.dart';
import 'package:reproeduser/pages/route/route_context.dart';
import 'package:reproeduser/pages/test/start_test.dart';
import 'package:reproeduser/pages/test/widgets/info_karaktaku.dart';

import '../models/test_models.dart';
import '../widgets/theme.dart';

class TestPemahaman extends StatelessWidget {
  const TestPemahaman({super.key, required this.listTest});

  final List<Test> listTest;

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => const Home(),
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
                    'Selamat Datang \n Test \n Pemahaman',
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
                itemCount: listTest.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.pushReplacement(
                      StartTest(
                        selectedTest: listTest[index],
                        listTest: listTest,
                      ),
                    );
                  },
                  child: Card(
                    color: const Color(0xffFFDD88),
                    child: Container(
                      width: double.infinity,
                      height: 170, // Set height for the card
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Test Pemahaman',
                            style: regularBlackTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            listTest[index].name,
                            style:
                                semiboldPURPLETextStyle.copyWith(fontSize: 20),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jumlah Salah',
                                style: regularBlackTextStyle.copyWith(
                                    fontSize: 12),
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFF5C5C),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text('18'),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jumlah Bener',
                                style: regularBlackTextStyle.copyWith(
                                    fontSize: 12),
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xff63F58C),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Center(child: Text('2')),
                              )
                            ],
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
    );
  }
}
