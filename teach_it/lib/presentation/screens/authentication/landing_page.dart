import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/starting%20page/starting_page.dart';
import 'package:teach_it/presentation/screens/home/home.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          child: const Text('continue'),
          onPressed: () {
            _checkLogin(context);
          },
        ),
      )),
    );
  }

  _checkLogin(context) {
    User? user = FirebaseAuth.instance.currentUser;
    bool loginstatus = user != null;
    if (loginstatus) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Yourcourses(),
          )).onError((error, stackTrace) => print('error is here $error'));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StartingPage(),
          ));
    }
  }
}
