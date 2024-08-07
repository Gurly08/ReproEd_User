import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reproeduser/data/model/request/register_request_models.dart';
import 'package:reproeduser/pages/auth/bloc/bloc/register_bloc.dart';
import 'package:reproeduser/pages/home/dashboard.dart';
import '../widgets/buttons.dart';
import '../widgets/theme.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final namaController = TextEditingController();
  final umurController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;

  String? valueChoose;
  final List<String> listItem = ['Kelas 7', 'Kelas 8', 'Kelas 9'];
  final Map<String, String> kelasMapping = {
    'Kelas 7': 'kelas_7',
    'Kelas 8': 'kelas_8',
    'Kelas 9': 'kelas_9'
  };

  Color? lakiLakiColor = Colors.white;
  Color? perempuanColor = Colors.white;
  String? jenisKelamin;
  final Map<String, String> genderMapping = {
    'Laki-laki': 'laki_laki',
    'Perempuan': 'perempuan'
  };

  void selectLakiLaki() {
    setState(() {
      lakiLakiColor = Colors.blue[300];
      perempuanColor = Colors.white;
      jenisKelamin = 'Laki-laki';
    });
  }

  void selectPerempuan() {
    setState(() {
      perempuanColor = Colors.blue[300];
      lakiLakiColor = Colors.white;
      jenisKelamin = 'Perempuan';
    });
  }

  @override
  void dispose() {
    namaController.dispose();
    umurController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkblue,
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 45, bottom: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Daftar',
                    textAlign: TextAlign.start,
                    style: semiboldwhitetext.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Yuk daftar dulu sebelum menggunakan aplikasi ReproEd',
                textAlign: TextAlign.start,
                style: semiboldwhitetext.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 18),
              _buildTextField(
                  'Nama Lengkap', 'Contoh: Budi Tabuti', namaController),
              const SizedBox(height: 18),
              _buildTextField(
                  'Email', 'Contoh: budi@gmail.com', emailController,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 18),
              Text(
                "Kelas",
                textAlign: TextAlign.left,
                style: regularwhitetext.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 12),
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
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.blue[100],
                    hint: const Text('Pilih Kelas'),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    isExpanded: true,
                    value: valueChoose,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listItem.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              _buildTextField('Umur', 'Umur', umurController,
                  keyboardType: TextInputType.number, width: 70),
              const SizedBox(height: 18),
              Text(
                "Jenis Kelamin",
                textAlign: TextAlign.left,
                style: regularwhitetext.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildGenderButton(
                      'Laki-laki', lakiLakiColor, selectLakiLaki),
                  const SizedBox(width: 16),
                  _buildGenderButton(
                      'Perempuan', perempuanColor, selectPerempuan),
                ],
              ),
              const SizedBox(height: 18),
              _buildPasswordField(),
              const SizedBox(height: 25),
              BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (authResponseModel) {
                      print('Registrasi berhasil: ${authResponseModel.user}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Selamat akun kamu sudah dibuat'),
                          backgroundColor: Colors.greenAccent,
                        ),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                        );
                      });
                    },
                    error: (message) {
                      print('Registrasi gagal: $message');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Registrasi gagal: $message'),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Button.filled(
                        onPressed: () {
                          print('Nama: ${namaController.text}');
                          print('Email: ${emailController.text}');
                          print('Kelas: ${kelasMapping[valueChoose]}');
                          print('Umur: ${umurController.text}');
                          print('Jenis Kelamin: ${genderMapping[jenisKelamin]}');
                          print('Password: ${passwordController.text}');
                          final dataRequest = RegisterRequestModels(
                            name: namaController.text,
                            email: emailController.text,
                            kelas: kelasMapping[valueChoose]!,
                            umur: umurController.text,
                            jenisKelamin: genderMapping[jenisKelamin]!,
                            password: passwordController.text,
                          );
                          context
                              .read<RegisterBloc>()
                              .add(RegisterEvent.register(data: dataRequest));
                        },
                        label: 'Daftar',
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String hint, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text,
      double width = double.infinity}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: regularwhitetext.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 12),
        Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderButton(
      String label, Color? color, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          textAlign: TextAlign.left,
          style: regularwhitetext.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 12),
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
                offset: const Offset(0, 2),
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
              suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
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
      ],
    );
  }
}
