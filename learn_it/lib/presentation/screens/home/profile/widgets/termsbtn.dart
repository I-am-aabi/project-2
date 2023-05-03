import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/signup%20page/widgets/policy_dialogue.dart';

class Termsbtn extends StatelessWidget {
  const Termsbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
           showDialog(
                          context: context,
                          builder: (context) {
                            return PolicyDialog(
                                mdfilename: 'terms_conditions.md');
                          });
        },
        child: const SizedBox(
          height: 40,
          child: Text(
            'Terms & conditions',
            style: TextStyle(fontSize: 18, fontFamily: 'PoppinsMedium'),
          ),
        ));
  }
}
