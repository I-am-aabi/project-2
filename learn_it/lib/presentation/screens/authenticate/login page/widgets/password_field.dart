import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/functions/signup.dart';

class Passfield extends StatelessWidget {
  const Passfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280,
          height: 40,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            cursorColor: Colors.black,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: const InputDecoration(
              hintText: '*************',
              hintStyle: TextStyle(color: Colors.black38,fontSize: 18),
             
            ),
          ),
        ),
      ],
    );
  }
}