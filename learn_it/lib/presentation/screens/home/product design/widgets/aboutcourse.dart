import 'package:flutter/material.dart';

class Aboutcourse extends StatelessWidget {
  const Aboutcourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '6h 14min - 24 lesson',
          style: TextStyle(color: Colors.black38, fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        Text('About this course',
            style: TextStyle(fontSize: 20, fontFamily: 'PoppinsMedium')),
        SizedBox(
          height: 10,
        ),
        Text(
          'This Specialization is designed for aspiring and active product leaders seeking to pursue careers in product management, product design, and related roles. Through five practical courses, you will learn the fundamentals for designing and managing products. Upon completion, you will have created your own personal toolbox of knowledge and techniques for approaching and solving real-world problems that product leaders face.',
          style: TextStyle(color: Colors.black45,
          fontFamily: 'Poppinsthin'
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
