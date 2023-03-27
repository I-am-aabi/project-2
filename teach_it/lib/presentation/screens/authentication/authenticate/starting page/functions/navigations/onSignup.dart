import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/signup%20page/sign_up.dart';


onSignup(context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Signuppage(),
      ));
}
