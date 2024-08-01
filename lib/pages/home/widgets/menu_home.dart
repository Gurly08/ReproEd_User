import 'package:flutter/material.dart';

class MenuHome extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const MenuHome({
    super.key,
    required this.color,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 200,
        width: 150,
        decoration: ShapeDecoration(
          color: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 25,
              offset: Offset(8, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 22, left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: Image.asset(imagePath)),
              const SizedBox(height: 35),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
