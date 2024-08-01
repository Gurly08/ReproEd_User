import 'package:flutter/material.dart';

import '../home/home.dart';
import '../widget/theme.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 155, 33, 255),
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              //gambar sebagai gambar tampilan disetiap landing page(Sebagai BG)
                Image.asset(
                  "assets/images/dna.png",
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                ),

                //pembuatan container untuk isi konten
                ListView(
                  children: [
                    const SizedBox(
                      height: 325,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 110, 12, 190),
                            Color.fromARGB(255, 93, 34, 255),
                          ], // Gradient colors
                        ),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 45),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Login",
                              textAlign: TextAlign.left,
                              style: semiboldwhitetext.copyWith(fontSize: 25),
                            ),
                            Text(
                              "Selamat Datang Kembali Di Aplikasi ReproEd",
                              textAlign: TextAlign.start,
                              style: mediumWhiteTextStyle.copyWith(fontSize: 15),
                            ),
                            
                            const SizedBox(height: 12),

                            Text(
                              "Email",
                              textAlign: TextAlign.left,
                              style: regularwhitetext.copyWith(fontSize: 15),
                            ),
                            const SizedBox(height: 12),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Masukan email',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: const Icon(Icons.person),
                                ),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            //Jarak antar email dengan password
                            const SizedBox(height: 15),

                            Text(
                              "Password",
                              textAlign: TextAlign.left,
                              style: regularwhitetext.copyWith(fontSize: 15),
                            ),
                            const SizedBox(height: 12),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  hintText: 'Masukan password',
                                  filled: false,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: const Icon(Icons.lock_outlined),
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                obscureText: _obscureText,
                              ),
                            ),
                            
                            const SizedBox(height: 35),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                      context, 
                                        MaterialPageRoute(builder: (context) => const Home())
                                    );
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  elevation: 8,
                                  shadowColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(45)),
                              child: Text(
                                "Masuk",
                                textAlign: TextAlign.center,
                                style: mediumPURPLETextStyle.copyWith(fontSize: 18),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Apakah kamu sudah memiliki akun ReproEd?",
                                  textAlign: TextAlign.center,
                                  style: regularwhitetext.copyWith(fontSize: 8),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context, 
                                        MaterialPageRoute(builder: (context) => const Signup())
                                    );
                                  },
                                  child: Text(
                                    "Daftar",
                                    textAlign: TextAlign.center,
                                    style: regularwhitetext.copyWith(fontSize: 5),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          )
        ),
      ),
    );
  }
}