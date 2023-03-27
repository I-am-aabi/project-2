import 'package:flutter/material.dart';
import 'package:teach_it/core/colors.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/starting%20page/functions/navigations/onSignin.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/starting%20page/functions/navigations/onSignup.dart';

class Signinup extends StatelessWidget {
  const Signinup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            onSignin(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: loginbt,
            fixedSize: const Size(160.0, 40.0),
          ),
          child: const Text(
            "Sign in",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            onSignup(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: signUpbt,
            fixedSize: const Size(160.0, 40.0),
          ),
          child: const Text(
            "Sign up",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
