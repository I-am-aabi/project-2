import 'package:flutter/material.dart';

class Offercourse extends StatelessWidget {
  const Offercourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Image.asset('assets/images/offer.jpg'),
    );
  }
}