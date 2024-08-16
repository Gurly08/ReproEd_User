import 'package:flutter/material.dart';
import 'package:reproeduser/core/extentions/build_context_ext.dart';
// import 'package:reproeduser/core/extentions/build_context_ext.dart';
// import 'package:reproeduser/pages/route/route_context.dart';
import 'package:reproeduser/pages/testpemahaman/models/test_pemahaman_model.dart';
import '../widgets/color.dart';
import '../widgets/custom_scaffold.dart';
import 'finish_test.dart';
import 'widgets/countdown.dart';
import 'widgets/test_multiple_choice.dart';

class QuizStartPage extends StatefulWidget {
  final QuizModel data;

  const QuizStartPage({
    super.key,
    required this.data,
  });

  @override
  State<QuizStartPage> createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  @override
  Widget build(BuildContext context) {
    int quizNumber = 6;

    return CustomScaffold(
      appBarTitle: Text(widget.data.name),
      actions: [
        const Icon(Icons.punch_clock, color: Colors.white, weight: 24),
        const SizedBox(width: 8.0),
        CountdownTimer(
          duration: widget.data.duration,
          onTimerCompletion: (timeRemaining) {
            context.pushReplacement(FinishTest(
              data: widget.data,
              timeRemaining: timeRemaining,
            ));
          },
        ),
        IconButton(
            onPressed: () {
              context.pushReplacement(FinishTest(
                data: widget.data,
                timeRemaining: 0,
              ));
            },
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            )),
        const SizedBox(width: 24.0),
      ],
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const Text(
            'Pertanyaan',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Flexible(
                child: LinearProgressIndicator(
                  value: quizNumber / 25,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                '$quizNumber/25',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const QuizMultipleChoice(),
        ],
      ),
    );
  }
}