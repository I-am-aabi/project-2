import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/email_field.dart';
import 'package:learn_it/presentation/screens/home/widgets/navigation.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confpassController = TextEditingController();

signUp(context) {
  errrorflag == false ?
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
      .then((value) {
    User? user = FirebaseAuth.instance.currentUser;
    user!.updateDisplayName(confpassController.text.toString());
     FirebaseFirestore.instance
        .collection('students')
        .doc(confpassController.text.toString() + user.uid)
        .set({
          'name' : confpassController.text.toString(),
          'uid' : user.uid,
          'subscriptions' : [],
          'favorites' : [],
        });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Navbar()));
    loginDispose();
  }):  Fluttertoast.showToast(
        msg: 'check for the errors', backgroundColor: const Color.fromARGB(255, 212, 29, 29));
}

loginDispose() {
  emailController.clear();
  passwordController.clear();
  confpassController.clear();
}
