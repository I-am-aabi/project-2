import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/widgets/policy_dialogue.dart';

class TermsandConditions extends StatelessWidget {
  const TermsandConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'By creating an account, you are agreeing to our ',
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                  text: 'Terms of service ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return PolicyDialog(
                                mdfilename: 'terms_conditions.md');
                          });
                    }),
              const TextSpan(
                  text: 'and ', style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: 'privacy policy ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                  recognizer: TapGestureRecognizer()..onTap = () {

                      showDialog(
                          context: context,
                          builder: (context) {
                            return PolicyDialog(
                                mdfilename: 'privacy_policy.md');
                          });
                  })
            ]));
  }
}
