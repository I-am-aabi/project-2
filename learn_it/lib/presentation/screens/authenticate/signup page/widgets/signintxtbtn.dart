import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/functions/navigations/tosignin.dart';


class Signintxtbtn extends StatelessWidget {
  const Signintxtbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(fontSize: 14,color: Colors.black87),
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
          onPressed: () {
            toSignin(context);
          },
          child: const Text(
            "Sign in",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
