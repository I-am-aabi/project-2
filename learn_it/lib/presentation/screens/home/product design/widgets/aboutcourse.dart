import 'package:flutter/material.dart';

class Aboutcourse extends StatelessWidget {
   Aboutcourse(
      {super.key, required this.lectures, required this.discription});
  final String lectures;
  final String discription;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' $lectures lectures',
          style: const TextStyle(color: Colors.black38, fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(' About this course',
            style: TextStyle(fontSize: 20, fontFamily: 'PoppinsMedium')),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              discription,
              style:
                  const TextStyle(color: Colors.black87, fontFamily: 'Poppinsthin'),
            ),
          ),
        )

        //  Text(
        //   '14/24 completed',
        //   style: TextStyle(color: Colors.black38, fontSize: 16),
        // ),
      ],
    );
  }
}
