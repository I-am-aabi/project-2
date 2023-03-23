import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/login_page.dart';

toSignin(context) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
}
