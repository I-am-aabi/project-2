import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/functions/signup.dart';
import 'package:learn_it/presentation/screens/home/widgets/navigation.dart';

signIn(context) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
      .then((value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Navbar(),
          )));
  loginDispose();
}
