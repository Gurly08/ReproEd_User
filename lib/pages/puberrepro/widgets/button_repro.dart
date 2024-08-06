import 'package:flutter/material.dart';

import '../../widgets/theme.dart';

class ButtonRepro extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onSelected;
  final String text;
  const ButtonRepro({
    super.key,
    required this.isSelected,
    required this.onSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSelected,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: isSelected ? 8 : 0,
        shadowColor: Colors.white,
        backgroundColor: isSelected ? Colors.teal[700] : Colors.teal[500],
        minimumSize: const Size(115, 25),
      ),
      child: Text(
        text,
        style: semiboldwhitetext.copyWith(fontSize: 12),
      ),
    );
  }
}
