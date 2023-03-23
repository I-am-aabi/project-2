import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/functions/signup.dart';

class SignupContinuebtn extends StatelessWidget {
  const SignupContinuebtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        signUp(context);
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          fixedSize: MaterialStateProperty.all(const Size(250, 40)),
          backgroundColor: MaterialStateProperty.all(loginbt)),
      child: const Text(
        "Sign up",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
