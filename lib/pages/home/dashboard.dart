import 'package:flutter/material.dart';
import '../../data/model/response/edukasi_response_models.dart'; 
import '../edukasi/edukasi_artikel.dart';
import '../models/test_models.dart';
import '../profil/profil.dart';
import '../testpemahaman/test_pemahaman.dart';
import 'home.dart';
import 'widgets/nav_menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  // Inisialisasi listEdukasi dan listTest dengan data kosong atau data aktual
  final List<Edukasi> listEdukasi = []; // Pastikan data ini terisi sebelum digunakan
  // final List<Test> listTest = []; // Pastikan data ini terisi sebelum digunakan

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Inisialisasi _pages setelah listEdukasi dan listTest terdefinisi
    _pages = [
      const Home(),
      TestPemahaman(listTest: listTest),
      EdukasiArtikel(listEdukasi: listEdukasi),
      const Profil(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavMenu(
              iconPath: Icons.home_rounded,
              label: 'Home',
              isActive: _selectedIndex == 0,
              onPressed: () => _onItemTapped(0),
            ),
            NavMenu(
              iconPath: Icons.quiz_outlined,
              label: 'Karaktaku',
              isActive: _selectedIndex == 1,
              onPressed: () => _onItemTapped(1),
            ),
            NavMenu(
              iconPath: Icons.auto_stories_outlined,
              label: 'Edukasi',
              isActive: _selectedIndex == 2,
              onPressed: () => _onItemTapped(2),
            ),
            NavMenu(
              iconPath: Icons.person_outline_outlined,
              label: 'Profil',
              isActive: _selectedIndex == 3,
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
