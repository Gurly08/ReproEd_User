import 'package:flutter/material.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';

import '../../widgets/theme.dart';

class InfoKaraktaku extends StatelessWidget {
  const InfoKaraktaku({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        height: 300,
        width: 375,
        color: const Color.fromARGB(223, 255, 221, 136),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Assets.images.welcomekaraktaku.path,
              width: 200,
              height: 150,
            ),
            const SizedBox(height: 15),
            Text(
              maxLines: 4,
              'Karaktaku adalah sebuah test pemahaman yang dapat membantu kamu meningkatkan pemahaman mu terkait Reproduksi Edukasi',
              style: mediumBlackTextStyle.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
