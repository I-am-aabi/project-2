import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/product%20design/widgets/aboutcourse.dart';
import 'package:learn_it/presentation/screens/home/product%20design/widgets/lesson.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class Productdesign extends StatelessWidget {
  const Productdesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            Heading(heading: 'Produt Design v1.0'),
            SizedBox(
              height: 5,
            ),
            Aboutcourse(),
            SizedBox(
              height: 20,
            ),
            Lesson(
              description: 'welcome to the course',
              num: '01',
              played: true,
            ),
            SizedBox(
              height: 5,
            ),
            Lesson(
              description: 'Process over view',
              num: '02',
              played: true,
            ),
            SizedBox(
              height: 5,
            ),
            Lesson(
              description: 'Discovery',
              num: '03',
              played: false,
            ),
            SizedBox(
              height: 5,
            ),
            Lesson(
              description: 'Brushes and tools',
              num: '04',
              played: false,
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
