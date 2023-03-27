import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/functions/signup.dart';
import 'package:learn_it/presentation/screens/home/widgets/navigation.dart';

signIn(context) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
      .then((value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Navbar(),
          )))
      .then((value) {
    Fluttertoast.showToast(
        msg: 'signed in successfully', backgroundColor: Colors.green);
  }).
  onError((error, stackTrace) {
    Fluttertoast.showToast(msg: 'error occurred');
  });
  loginDispose();
}
