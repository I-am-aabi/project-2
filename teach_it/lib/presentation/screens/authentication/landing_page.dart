import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/starting%20page/starting_page.dart';
import 'package:teach_it/presentation/screens/home/home.dart';

class Landingpage extends StatelessWidget {
  Landingpage({super.key});
  String? name = '';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: checklogin,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return Yourcourses();
          } else {
            return const StartingPage();
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Stream checklogin = (() async* {
    User? user = FirebaseAuth.instance.currentUser;
    bool loginstatus = user != null;
    if (loginstatus) {
      yield true;
    } else {
      yield false;
    }
  })();
}
