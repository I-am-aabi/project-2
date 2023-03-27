import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key, required this.heading, required this.discription});
  final String heading;
  final String discription;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const SizedBox(
          height: 40,
        ),
        Text(
          heading,
          style: const TextStyle(fontSize: 38, fontFamily: 'PoppinsBold'),
        ),
        Text(
          discription,
          style: const TextStyle(
              fontSize: 20, fontFamily: 'Poppinsthin', color: Colors.black45),
        ),
      ],
    );
  }
}
