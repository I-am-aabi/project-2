import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';

class Paybtn extends StatelessWidget {
  const Paybtn({super.key, required this.pay});
  final Future pay;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: loginbt,
            fixedSize: const Size(160.0, 40.0),
          ),
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            pay;
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: signUpbt,
            fixedSize: const Size(160.0, 40.0),
          ),
          child: const Text(
            "Pay now",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
