import 'package:flutter/material.dart';
import 'package:reproeduser/core/assets/assets.gen.dart';
import 'package:reproeduser/pages/home/widgets/header_home.dart';
import 'package:reproeduser/pages/home/widgets/menu_home.dart';
import 'package:reproeduser/pages/widget/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderHome(),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Beranda',
                      style: mediumBlackTextStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuHome(
                        color: Colors.teal,
                        imagePath: Assets.images.boy.path,
                        label: 'PuberReproMan',
                        onPressed: () {},
                      ),
                      MenuHome(
                        color: Colors.pink.shade200,
                        imagePath: Assets.images.girl.path,
                        label: 'PuberReproMan',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuHome(
                        color: const Color.fromARGB(255, 72, 200, 170),
                        imagePath: Assets.images.wpkuis.path,
                        label: 'Edukasi',
                        onPressed: () {},
                      ),
                      MenuHome(
                        color: Colors.amber,
                        imagePath: Assets.images.rbkaraktaku.path,
                        label: 'Karaktaku',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
