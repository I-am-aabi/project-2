import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/fogotpswd.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/ortext.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/signin_continue.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/email_field.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/signuptxtbtn.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/welcome_text.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/password_field.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/widgets/terms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                padding: const EdgeInsets.only(left:30.0,right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  const [
                    SizedBox(height: 30,),
                    WelcomeText(heading: 'Welcome!',discription: 'Sign in to continue'),
                    SizedBox(
                      height: 50,
                    ),
                    Emailfield(),
                    SizedBox(
                      height: 40,
                    ),
                    Passfield(),
                    SizedBox(
                      height: 50,
                    ),
                    Center(child: SigninContinuebtn()),
                    Forgotpass(),
                    SizedBox(
                      height: 10,
                    ),
                    Ortext(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Loginwith(),
                    SizedBox(height: 25,),
                    Signuptxtbtn(),
                    SizedBox(height: 20,),
                    TermsandConditions()
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
