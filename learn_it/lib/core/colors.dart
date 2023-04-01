import 'package:flutter/material.dart';

Color lpbackground = Colors.white;
Color signUpbt = const Color.fromARGB(255, 113, 124, 244);
Color loginbt = Colors.blue.shade700;
Color navbar = const Color.fromARGB(31, 201, 237, 255);
Color nabaricon = Colors.black54;
Color backGround = const Color.fromARGB(0, 215, 80, 80);
Color containerclr = Colors.black;
Color catgtextclr = Colors.black;
getColor(int j) {
 int i = j % 4;
  if (i == 0) {
    containerclr = Colors.purple.shade50;
    catgtextclr = Colors.purple.shade800;
  } else if (i == 1) {
    containerclr = Colors.red.shade50;
    catgtextclr = Colors.red.shade800;
  } else if (i == 2) {
    containerclr = Colors.green.shade50;
    catgtextclr = Colors.green.shade800;
  } else {
    containerclr = Colors.cyan.shade50;
    catgtextclr = Colors.cyan.shade800;
  }
}
