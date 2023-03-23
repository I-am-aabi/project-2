import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/search%20page/widgets/course_category.dart';
import 'package:learn_it/presentation/screens/home/search%20page/widgets/explore.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Explore(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Categoryimg(
                      path: 'assets/images/maths.png',
                      color: 0,
                      subject: 'Maths'),
                  Categoryimg(
                    path: 'assets/images/science.png',
                    color: 1,
                    subject: 'Science',
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Categoryimg(
                      path: 'assets/images/arts.png',
                      color: 2,
                      subject: 'Arts'),
                  Categoryimg(
                    path: 'assets/images/language.png',
                    color: 3,
                    subject: 'Language',
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Categoryimg(
                      path: 'assets/images/design.png',
                      color: 0,
                      subject: 'Design'),
                  Categoryimg(
                    path: 'assets/images/programming.png',
                    color: 1,
                    subject: 'Coding',
                  )
                ],
              ),
            ]),
      )),
    );
  }
}
