import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/email_field.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/functions/signup.dart';

class Passfield extends StatefulWidget {
  const Passfield({super.key});

  @override
  State<Passfield> createState() => _PassfieldState();
}

class _PassfieldState extends State<Passfield> {
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
            controller: passwordController,
            onChanged: (value) => setState(() {
              _errortext();
            }),
            onTap: () {
              setState(() {
                _errortext();
              });
            },
            textDirection: TextDirection.ltr,
            obscureText: true,
            cursorColor: Colors.black,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
                hintText: '*************',
                hintStyle: const TextStyle(color: Colors.black38, fontSize: 18),
                errorText: error),
          ),
        ),
      ],
    );
  }

  _errortext() {
    if (passwordController.text.isEmpty) {
      error = 'Can\'t be empty';
      errrorflag = true;
      return;
    }
    if (passwordController.text.length < 8 &&
        passwordController.text.isNotEmpty) {
      errrorflag = true;
      error = 'Password must be at least 8 characters';
      return;
    }
    errrorflag = false;
    error = null;
    return null;
  }
}
