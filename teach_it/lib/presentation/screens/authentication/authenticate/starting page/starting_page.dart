import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/starting%20page/widgets/signin_signup.dart';
import 'package:teach_it/presentation/screens/home/home.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
                height: 300,
                width: 300,
                child: Image.asset('assets/images/begin.png')),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
                width: 250,
                child: Text(
                  'Welcome to the world of unlimited knowledge and opportunities',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 18),
                )),
            const SizedBox(
              height: 50,
            ),
            const Signinup()
          ],
        ),
      )),
    );
  }
}



