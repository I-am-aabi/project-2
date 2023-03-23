import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/sign_up.dart';

toSignup(context) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Signuppage(),
      ));
}
