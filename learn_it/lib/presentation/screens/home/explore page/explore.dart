import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/explore%20page/widgets/course_category.dart';
import 'package:learn_it/presentation/screens/home/explore%20page/widgets/explore.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});
  List<String> subjects = [
    'Maths',
    'Science',
    'Arts',
    'Language',
    'Design',
    'Coding',
    'Marketing',
    'Business',
    'Music',
    'Prodictivity',
    'Lifestyle',
    'Other'
  ];
  List<String> images = [
    'assets/images/maths.png',
    'assets/images/science.png',
    'assets/images/arts.png',
    'assets/images/language.png',
    'assets/images/design.png',
    'assets/images/programming.png',
    'assets/images/marketing.png',
    'assets/images/business.png',
    'assets/images/music.png',
    'assets/images/productivity.png',
    'assets/images/lifestyle.png',
    'assets/images/other.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
              children: [
                const Explore(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Categoryimg(
                                path: images[index + index],
                                color: index + index,
                                subject: subjects[index + index]),
                            Categoryimg(
                              path: images[index + 1 + index],
                              color: index + 1 + index,
                              subject: subjects[index + 1 + index],
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: images.length ~/ 2),
                ),
              ]),
        ),
      )),
    );
  }
}
