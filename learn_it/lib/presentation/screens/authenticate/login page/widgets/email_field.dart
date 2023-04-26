import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/functions/signup.dart';

bool errrorflag = true;

class Emailfield extends StatefulWidget {
  const Emailfield({super.key});

  @override
  State<Emailfield> createState() => _EmailfieldState();
}

class _EmailfieldState extends State<Emailfield> {
  String? error = null;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280,
          height: 40,
          child: TextField(
            onChanged: (value) => setState(() {
              _errortext();
            }),
            onTap: () {
              setState(() {
                _errortext();
              });
            },
            textDirection: TextDirection.ltr,
            controller: emailController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Colors.black,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
                hintText: 'example@gmail.com',
                hintStyle: const TextStyle(color: Colors.black38, fontSize: 18),
                errorText: error),
          ),
        ),
      ],
    );
  }

  _errortext() {
    if (emailController.text.isEmpty) {
      errrorflag = true;
      error = 'Can\'t be empty';
      return;
    }
    errrorflag = false;
    error = null;
  }
}
