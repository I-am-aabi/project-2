import 'package:flutter/material.dart';

class Addcourse extends StatelessWidget {
  const Addcourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Course')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    backgroundBlendMode: BlendMode.darken,
                    borderRadius: BorderRadius.circular(20)),
                child: const TextField(
                  autofocus: true,
                  maxLength: 20,
                  decoration: InputDecoration(
                      hintText: ' Course Title', border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20)),
                  child: const TextField(
                    maxLines: 20,
                  )),
            )
          ],
        ),
      )),
    );
  }
}
