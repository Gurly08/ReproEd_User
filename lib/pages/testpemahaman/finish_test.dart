import 'package:flutter/material.dart';
import 'package:reproeduser/core/extentions/build_context_ext.dart';
import 'package:reproeduser/pages/home/dashboard.dart';
import 'package:reproeduser/pages/testpemahaman/result_test.dart';
import '../widgets/buttons.dart';
import '../widgets/color.dart';
import '../widgets/custom_scaffold.dart';
import 'models/test_pemahaman_model.dart';
import 'widgets/countdown.dart';

class FinishTest extends StatefulWidget {
  final QuizModel data;
  final int timeRemaining;
  const FinishTest({
    super.key,
    required this.data,
    required this.timeRemaining,
  });

  @override
  State<FinishTest> createState() => _FinishTestState();
}

class _FinishTestState extends State<FinishTest> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: Text(widget.data.name),
      actions: [
        const Icon(Icons.punch_clock, color: Colors.white, weight: 24),
        const SizedBox(width: 8.0),
        CountdownTimer(
          duration: widget.timeRemaining,
          onTimerCompletion: (timeRemaining) {},
        ),
        const SizedBox(width: 24.0),
      ],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.asset('assets/images/finish.png'),
              const Text(
                'Yeayy Finish',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 42.0),
              Button.filled(
                onPressed: () => context.pushReplacement(const Dashboard()),
                label: 'Kembali ke Beranda',
                color: AppColors.white,
                textColor: AppColors.primary,
              ),
              const SizedBox(height: 28.0),
              Button.filled(
                onPressed: () => 
                context.push(const ResultTest()),
                label: 'Lihat Hasil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}