import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/signup%20page/functions/signup.dart';
import 'package:teach_it/presentation/screens/home/home.dart';

signIn(context) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
      .then((value) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Yourcourses(),
        ));
  }).onError((error, stackTrace) {
    print('error $error');
  });
  loginDispose();
}
