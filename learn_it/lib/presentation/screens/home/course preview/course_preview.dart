import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/aboutcourse.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/courseimage.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/floatingaction.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/lesson.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class Coursepreview extends StatelessWidget {
  const Coursepreview(
      {super.key, required this.document, required this.locked});
  final Map<String, dynamic> document;
  final bool locked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Courseimg(url: document['imgurl']),
              Padding(
                padding: const EdgeInsets.only(left: 3.0, top: 5),
                child: Heading(heading: document['title']),
              ),
              const SizedBox(
                height: 5,
              ),
              Aboutcourse(
                  discription: document['discription'],
                  lectures: document['lectures']),
              const SizedBox(
                height: 20,
              ),
              const Text(' Lectures',
                  style: TextStyle(fontSize: 20, fontFamily: 'PoppinsMedium')),
              const SizedBox(
                height: 15,
              ),
              document['links'].length == 0
                  ? Image.asset('assets/images/nolectures.png')
                  : ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Lesson(
                            locked: locked == true
                                ? (index == 0 ? false : true)
                                : false,
                            document: document,
                            description: document['discriptions'][index],
                            url: document['links'][index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: document['links'].length),
              const SizedBox(
                height: 150,
              )
            ],
          ),
        )),
        floatingActionButton: const Buyfltbtn(visible: true,));
  }
}
