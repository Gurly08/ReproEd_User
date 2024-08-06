import 'package:flutter/material.dart';

import '../../widgets/theme.dart';

class CardPubertas extends StatelessWidget {
  final String imagePath;
  final String subtitle;
  final String title;
  final VoidCallback onPressed;
  const CardPubertas({
    super.key,
    required this.subtitle,
    required this.imagePath,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 400,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.teal[600],
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: Image.asset(imagePath)),
              const SizedBox(height: 35),
              Text(
                subtitle,
                style: regularwhitetext.copyWith(
                  fontSize: 12,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: boldwhitetext.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
