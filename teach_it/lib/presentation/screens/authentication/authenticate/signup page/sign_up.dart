import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/login%20page/widgets/email_field.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/login%20page/widgets/loginwith.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/login%20page/widgets/ortext.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/login%20page/widgets/password_field.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/login%20page/widgets/welcome_text.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/signup%20page/widgets/confpasss.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/signup%20page/widgets/signintxtbtn.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/signup%20page/widgets/signup_continue.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              padding: EdgeInsets.zero,
              iconSize: 40,
              onPressed: () {
                Navigator.pop(context);
              },
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                    WelcomeText(
                        heading: 'Hi!', discription: 'Create a new account'),
                    SizedBox(
                      height: 50,
                    ),
                    Username(),
                    SizedBox(
                      height: 40,
                    ),
                    Emailfield(),
                    SizedBox(
                      height: 40,
                    ),
                    Passfield(),
                    SizedBox(
                      height: 50,
                    ),
                    Center(child: SignupContinuebtn()),
                    // Forgotpass(),
                    SizedBox(
                      height: 10,
                    ),
                    Ortext(),
                    SizedBox(
                      height: 20,
                    ),
                    Loginwith(),
                    SizedBox(
                      height: 25,
                    ),
                    Signintxtbtn(),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
