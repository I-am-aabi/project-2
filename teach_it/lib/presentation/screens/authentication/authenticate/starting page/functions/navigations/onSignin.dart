// ignore: file_names
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/login%20page/login_page.dart';

onSignin(context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
}
