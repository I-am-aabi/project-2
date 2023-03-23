import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/my%20course/widgets/course2.dart';
import 'package:learn_it/presentation/screens/home/my%20course/widgets/course3.dart';
import 'package:learn_it/presentation/screens/home/my%20course/widgets/course_progress.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Heading(heading: 'My courses'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Coursepro1(),Coursepro2()],),
              const SizedBox(height: 15,),
              Row(children: const [Coursepro3()],)
          ],
        ),
      )),
    );
  }
}
