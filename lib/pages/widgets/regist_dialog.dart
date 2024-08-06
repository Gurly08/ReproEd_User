import 'package:flutter/material.dart';

import 'buttons.dart';

class RegisterDIalog extends StatelessWidget {
  const RegisterDIalog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Column(
        children: [
          Icon(Icons.check_circle_outline_outlined),
          SizedBox(height: 14.0),
          Text(
            'Sign up successful!',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      content: const Text(
        'Your account has been created. Please wait a moment, we are preparing for you...',
      ),
      actions: [
        Button.filled(
          onPressed: () {},
          label: 'Redirecting...',
          icon: const SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}