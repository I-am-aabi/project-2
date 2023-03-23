import 'package:flutter/cupertino.dart';

class Textbtn extends StatelessWidget {
  const Textbtn({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
        child:  SizedBox(
          height: 40,
      child: Text(text,
      style: const TextStyle(fontSize: 18,
      fontWeight: FontWeight.w400),),
    ));
  }
}
