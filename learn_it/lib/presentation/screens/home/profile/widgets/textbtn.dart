import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_it/presentation/screens/authenticate/starting%20page/starting_page.dart';

class Textbtn extends StatelessWidget {
  const Textbtn({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StartingPage(),
                  ))
              .then((value) => {
                    Fluttertoast.showToast(
                        msg: 'Loged out successfully',
                        backgroundColor: Colors.green)
                  })
              .onError((error, stackTrace) => {
                Fluttertoast.showToast(msg: 'some error occured')
              });
        },
        child: SizedBox(
          height: 40,
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ));
  }
}
