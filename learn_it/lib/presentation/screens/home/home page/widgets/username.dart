import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Username extends StatelessWidget {
  const Username({super.key});

  @override
  Widget build(BuildContext context) {
    final String? username = FirebaseAuth.instance.currentUser!.displayName;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text(
              'Welcome',
              style: TextStyle(color: Colors.black26, fontSize: 20),
            ),
            Text(
              username!,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
        Icon(Icons.account_circle_rounded,color: Colors.blue.shade300,size: 50,)
      ],
    );
  }
}
