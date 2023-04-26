import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/login%20page/widgets/email_field.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/functions/signup.dart';

class Username extends StatefulWidget {
  Username({super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
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
            onTap: () => setState(() {
              _errortext();
            }),
            controller: confpassController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Colors.black,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            decoration: InputDecoration(
                hintText: 'Tony Stark',
                hintStyle: const TextStyle(color: Colors.black38, fontSize: 18),
                errorText: error),
          ),
        ),
      ],
    );
  }

  _errortext() {
    if (confpassController.text.isEmpty) {
      error = 'Can\'t be empty';
      errrorflag = true;
      return;
    }
    if (confpassController.text.length < 4 &&
        confpassController.text.isNotEmpty) {
      errrorflag = true;
      error = 'Name must be at least 4 characters';
      return;
    }
    errrorflag = false;
    error = null;
  }
}
