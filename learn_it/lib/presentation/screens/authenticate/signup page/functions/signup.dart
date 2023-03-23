import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/widgets/navigation.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confpassController = TextEditingController();

signUp(context) {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
      .then((value) => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Navbar())));
  loginDispose();
}

loginDispose() {
  emailController.clear();
  passwordController.clear();
  confpassController.clear();
}
