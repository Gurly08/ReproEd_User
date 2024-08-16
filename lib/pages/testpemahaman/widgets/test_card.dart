import 'package:flutter/material.dart';
import 'package:reproeduser/core/extentions/build_context_ext.dart';
import 'package:reproeduser/pages/testpemahaman/models/test_pemahaman_model.dart';
import 'package:reproeduser/pages/testpemahaman/start_test.dart';
import '../../widgets/theme.dart';

class QuizCard extends StatefulWidget {
  final QuizModel data;
  const QuizCard({super.key, required this.data});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacement(StartTest(data: widget.data));
        // context.push(QuizStartPage(data: widget.data));
      },
      child: Card(
        color: const Color(0xffFFDD88),
        child: Container(
          width: double.infinity,
          height: 195, // Set height for the card
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test Pemahaman',
                style: regularBlackTextStyle.copyWith(fontSize: 15),
              ),
              Text(
                widget.data.name, //namatest
                style: semiboldPURPLETextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 12),
              Text(
                widget.data.type,
                style: regularBlackTextStyle.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 12),
              Text(
                widget.data.description,
                style: regularBlackTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
