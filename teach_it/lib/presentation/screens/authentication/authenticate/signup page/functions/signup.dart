import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/home/home.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confpassController = TextEditingController();

signUp(context) {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
      .then((value) {
    User? user = FirebaseAuth.instance.currentUser;
    user!.updateDisplayName(confpassController.text.toString());
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Yourcourses()));
    loginDispose();
  });
}

loginDispose() {
  emailController.clear();
  passwordController.clear();
  confpassController.clear();
}
