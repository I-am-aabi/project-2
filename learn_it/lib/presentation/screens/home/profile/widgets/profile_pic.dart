import 'package:flutter/cupertino.dart';

class Profilepic extends StatelessWidget {
  const Profilepic({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80)
      ),
      child: Image.asset('assets/images/profile.png')
    ));
  }
}