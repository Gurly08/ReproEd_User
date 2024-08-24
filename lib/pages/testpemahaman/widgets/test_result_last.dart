import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reproeduser/pages/testpemahaman/bloc/result/result_bloc.dart';
import 'package:reproeduser/pages/widgets/theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../data/datasource/ujian_datasource_remote.dart';
import '../../../data/model/response/result_response_models.dart';
import '../../widgets/color.dart';
import 'result_value.dart';

class TestResultLast extends StatefulWidget {
  const TestResultLast({super.key});

  @override
  State<TestResultLast> createState() => _TestResultLastState();
}

class _TestResultLastState extends State<TestResultLast> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultBloc(UjianRemoteDatasource())..add(const ResultEvent.getResult()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hasil Tes Terakhir',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16.0),
          BlocBuilder<ResultBloc, ResultState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const SizedBox.shrink();
                },
                loading: (_) {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (successState) {
                  return _buildResultContent(successState.response);
                },
                error: (errorState) {
                  return Center(child: Text(errorState.message));
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResultContent(ResultResponModels result) {
    int totalSteps = result.totalsoal > 0 ? result.totalsoal : 1; // Pastikan totalSteps minimal 1
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.14),
            blurRadius: 17,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semua Tes',
                  style: mediumBlackTextStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 18.0),
                ResultValue.correct(result.totalbenar),
                const SizedBox(height: 18.0),
                ResultValue.wrong(result.totalsalah),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                CircularStepProgressIndicator(
                  totalSteps: totalSteps,
                  currentStep: result.totalbenar,
                  stepSize: 10,
                  selectedColor: AppColors.green,
                  unselectedColor: AppColors.primary,
                  padding: 0,
                  width: 140,
                  height: 140,
                  selectedStepSize: 24,
                  unselectedStepSize: 24,
                  roundedCap: (_, __) => true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
