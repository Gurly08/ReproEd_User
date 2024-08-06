import 'package:flutter/material.dart';
import 'package:reproeduser/pages/widgets/theme.dart';

class NavMenu extends StatelessWidget {
  final IconData iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;
  const NavMenu({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isActive ? const Color.fromARGB(255, 240, 173, 252) : null,
          borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Row(
          children: [
            Icon(
              iconPath,
              color: isActive ? Colors.purpleAccent : Colors.black,
            ),
            if (isActive) const SizedBox(width: 4.0),
            if (isActive)
              Text(label,
                  style: mediumPURPLETextStyle.copyWith(
                    color: Colors.deepPurple,
                  )),
          ],
        ),
      ),
    );
  }
}
