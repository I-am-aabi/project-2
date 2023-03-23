import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/add%20course/add_course.dart';

class Yourcourses extends StatelessWidget {
  const Yourcourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Home'))),
      body: SafeArea(
          child: Column(
        children: const [],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Addcourse(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
