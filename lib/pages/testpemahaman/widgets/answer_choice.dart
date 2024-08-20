import 'package:flutter/material.dart';

import '../../widgets/color.dart';


enum AnswerCorrection { none, selected }

class AnswerChoices extends StatelessWidget {
  final String label;
  final void Function(String value) onChanged;
  final bool isSelected;
  final AnswerCorrection answerCorrection;

  const AnswerChoices({
    super.key,
    required this.label,
    required this.onChanged,
    this.isSelected = false,
    this.answerCorrection = AnswerCorrection.none,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => onChanged(label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: isSelected? AppColors.lightGreen : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                color: isSelected ? AppColors.lightRed : AppColors.white,
                shape: OvalBorder(
                  side: BorderSide(
                      width: isSelected ? 0 : 2, color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}