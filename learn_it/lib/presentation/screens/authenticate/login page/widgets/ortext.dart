import 'package:flutter/material.dart';

class Ortext extends StatelessWidget {
  const Ortext({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text('or'),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
