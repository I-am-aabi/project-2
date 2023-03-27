import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/signup%20page/functions/signup.dart';


class Emailfield extends StatelessWidget {
  const Emailfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        SizedBox(
          width: 280,
          height: 40,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Colors.black,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: const InputDecoration(
              hintText: 'example@gmail.com',
              hintStyle: TextStyle(color: Colors.black38,fontSize: 18),
              
            ),
          ),
        ),
      ],
    );
  }
}
