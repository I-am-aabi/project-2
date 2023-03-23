import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/sign_up.dart';

onSignup(context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Signuppage(),
      ));
}
