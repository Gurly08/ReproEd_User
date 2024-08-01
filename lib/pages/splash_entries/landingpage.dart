import 'package:flutter/material.dart';
import 'package:reproeduser/pages/route/route_context.dart';

import '../../core/assets/assets.gen.dart';
import '../models/landing_models.dart';
import '../widget/buttons.dart';
import '../widget/landing_content.dart';
import '../widget/landing_indicator.dart';
import '../widget/skip_button.dart';
import '../auth/login.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentPage = 0;
  final pageController = PageController();

  final landingpageData = [
    LandingModel(
      image: Assets.images.materi.path,
      text: 'Sebagai media pendukung pembelajaran seputar reproduksi',
    ),
    LandingModel(
      image: Assets.images.karaktaku.path,
      text: 'Soal Test yang memberikan tantangan menarik dengan beragam pertanyaan yang relevan tentang kesehatan reproduksi, membantu meningkatkan pemahaman.',
    ),
    LandingModel(
      image: Assets.images.kuis.path,
      text: 'Edukasi yang relevan di buat dengan artikel dan video',
    ),
  ];

  void navigate() {
  context.pushReplacement(const Login());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
            children: [
            SkipButton(onPressed: navigate),
            LandingContent(
              pageController: pageController,
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
              contents: landingpageData,
            ),
            LandingIndicator(
              length: landingpageData.length,
              currentPage: currentPage,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Button.filled(
                onPressed: (){
                  if (currentPage < landingpageData.length -1) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500), 
                      curve: Curves.ease,
                    );
                    currentPage++;
                    setState(() {});
                  } else {
                    navigate();
                  }
                },
                label: 'Mulai',
              ),
            )
        ],
      ),
    );
  }
}