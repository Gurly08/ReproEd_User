import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reproeduser/pages/testpemahaman/bloc/daftarsoal/daftar_soal_bloc.dart';
import 'package:reproeduser/pages/testpemahaman/bloc/hitungnilai/hitung_nilai_bloc.dart';
import 'package:reproeduser/pages/widgets/theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/color.dart';
import 'answer_choice.dart';

class QuizMultipleChoice extends StatefulWidget {
  final String kategori;
  const QuizMultipleChoice({
    super.key,
    required this.kategori,
    });

  @override
  State<QuizMultipleChoice> createState() => _QuizMultipleChoiceState();
}

class _QuizMultipleChoiceState extends State<QuizMultipleChoice> {
  @override
  Widget build(BuildContext context) {
    // final ValueNotifier<String> selectedAnswer = ValueNotifier("");//untuk dummy
    return BlocBuilder<DaftarSoalBloc, DaftarSoalState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: (){
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (data, index, isNext){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.14),
                        blurRadius: 17,
                        offset: const Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Text(
                    data[index].pertanyaan,
                    style: boldBlackTextStyle.copyWith(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 34.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnswerChoices(
                      label: data[index].jawabanA,
                      isSelected: false,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16.0),
                    AnswerChoices(
                      label: data[index].jawabanB,
                      isSelected: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const SizedBox(height: 38.0),
                isNext
                ? Button.filled(
                  onPressed: () {
                    context
                        .read<DaftarSoalBloc>()
                        .add(const DaftarSoalEvent.nextSoal());
                  },
                  label: 'Selanjutnya',
                )
                : Button.filled(
                  onPressed: () {
                    context
                    .read<HitungNilaiBloc>()
                    .add(const HitungNilaiEvent.getNilai('kategori'));
                  },
                  label: 'Selesai',
                ),
              ],
            );
          },
        );
      },
    );
  }
}
