import 'package:flutter/material.dart';

class Lesson extends StatelessWidget {
  const Lesson({super.key, required this.played, required this.description, required this.num});
  final bool played;
  final String description;
  final String num;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blue.shade50,borderRadius: BorderRadius.circular(10)),

      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
           Text(
            num,
            style: const TextStyle(fontSize: 40, color: Colors.black54),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  description,
                  style: const TextStyle(fontSize: 20,fontFamily: 'PoppinsMedium'),
                ),
                const Text('6:10 mins')
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.play_circle,
              size: 50,
              color:
              played  ==true ? 
               Colors.blue.shade300 : Colors.blue.shade800
            ),
            onPressed: () {},
            padding: EdgeInsets.zero,
          )
        ]),
      ),
    );
  }
}
