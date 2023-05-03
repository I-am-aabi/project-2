import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/widgets/policy_dialogue.dart';

class Privacybtn extends StatelessWidget {
  const Privacybtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          showDialog(
              context: context,
              builder: (context) {
                return PolicyDialog(mdfilename: 'privacy_policy.md');
              });
        },
        child: const SizedBox(
          height: 40,
          child: Text(
            'Privacy Policy',
            style: TextStyle(fontSize: 18, fontFamily: 'PoppinsMedium'),
          ),
        ));
  }
}
