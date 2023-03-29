import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/starting%20page/starting_page.dart';
import 'package:learn_it/presentation/screens/home/widgets/navigation.dart';

class Checklogininfo extends StatelessWidget {
  const Checklogininfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: checklogin,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('snap shot error');
          } else if (snapshot.hasData) {
            if (snapshot.data == true) {
              return const Navbar();
            } else {
              return const StartingPage();
            }
          }
        }
        return const Text('some error');
      },
    );
  }
}

Stream checklogin = (() async* {
  User? user = FirebaseAuth.instance.currentUser;
  bool loginstatus = user != null;
  if (loginstatus) {
    yield true;
  }
  else{
    yield false;
  }
})();
