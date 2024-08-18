import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reproeduser/data/datasource/edukasi_datasource_remote.dart';
import 'package:reproeduser/data/datasource/ujian_datasource_remote.dart';
import 'package:reproeduser/pages/auth/bloc/login/login_bloc.dart';
import 'package:reproeduser/pages/bloc/edukasi/edukasi_bloc.dart';
import 'package:reproeduser/pages/testpemahaman/bloc/createujian/create_ujian_bloc.dart';
import 'package:reproeduser/pages/testpemahaman/bloc/daftarsoal/daftar_soal_bloc.dart';
import 'package:reproeduser/pages/testpemahaman/bloc/hitungnilai/hitung_nilai_bloc.dart';
import 'package:reproeduser/pages/testpemahaman/bloc/ujianbykategori/ujian_by_kategori_bloc.dart';
import 'pages/auth/bloc/logout/logout_bloc.dart';
import 'pages/auth/bloc/register/register_bloc.dart';
import 'pages/splash_entries/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => EdukasiBloc(EdukasiRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UjianByKategoriBloc(UjianRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CreateUjianBloc(UjianRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DaftarSoalBloc(),
        ),
        BlocProvider(
          create: (context) => HitungNilaiBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splash(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
