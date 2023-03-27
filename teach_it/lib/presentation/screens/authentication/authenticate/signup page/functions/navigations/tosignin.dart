import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/login%20page/login_page.dart';

toSignin(context) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
}
