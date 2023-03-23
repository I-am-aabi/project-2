import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';
import 'package:learn_it/presentation/screens/getting%20started/landing_page/functions/navigations/continue_click.dart';

class Continuebtn extends StatelessWidget {
  const Continuebtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            onStart(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: loginbt,
            fixedSize: const Size(150.0, 40.0),
          ),
          child: const Text(
            "Continue",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
