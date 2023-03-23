import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/starting%20page/starting_page.dart';


onStart(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: ((context) => const StartingPage())));
}
