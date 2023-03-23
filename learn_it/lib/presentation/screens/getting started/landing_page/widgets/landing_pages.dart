import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';

class Page1 extends StatelessWidget {
  const Page1(
      {super.key,
      required this.path,
      required this.discription,
      required this.heading});
  final String path;
  final String heading;
  final String discription;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lpbackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(path),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 185,
              child: Text(
                heading,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 22, 22),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 220,
              child: Text(
                discription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 171, 170, 170),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
