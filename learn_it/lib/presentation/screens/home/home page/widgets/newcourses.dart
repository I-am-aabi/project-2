import 'package:flutter/material.dart';

class Newcourses extends StatelessWidget {
  const Newcourses({super.key});
  @override
  Widget build(BuildContext context) {
    Container mycontainer = Container(
      height: 120,
      width: 180,
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(20)),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'new courses',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 140,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              mycontainer,
              const SizedBox(
                width: 10,
              ),
              mycontainer,
              const SizedBox(
                width: 10,
              ),
              mycontainer,
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
