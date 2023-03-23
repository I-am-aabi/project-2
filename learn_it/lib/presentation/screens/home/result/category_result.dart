import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/result/widgets/result_card.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class Catresult extends StatelessWidget {
  const Catresult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [Heading(heading: 'Designing'),
        SizedBox(height: 20,),
        Resultcard()],),
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