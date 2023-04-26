import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/home%20page/widgets/newcourses.dart';
import 'package:learn_it/presentation/screens/home/home%20page/widgets/offer.dart';
import 'package:learn_it/presentation/screens/home/home%20page/widgets/username.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children:   [const Username(),
          const SizedBox(height: 20,),
          Offercourse(),
          const SizedBox(height: 20,
          ),
          const Newcourses(),
          const SizedBox(height: 20,),
          // const Watchedcourses(),
          const SizedBox(height: 20,)
          ],
        ),
      )),
    );
  }
}