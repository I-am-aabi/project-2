import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/signup%20page/sign_up.dart';


toSignup(context) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Signuppage(),
      ));
}
