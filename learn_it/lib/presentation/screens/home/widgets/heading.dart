import 'package:flutter/cupertino.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.heading});
 final String heading;
  @override
  Widget build(BuildContext context) {
    return  Text(
      heading,
      style: const TextStyle(fontSize: 24,fontFamily: 'PoppinsBold'),
    );
  }
}
