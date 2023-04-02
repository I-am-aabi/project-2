import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/product%20design/widgets/aboutcourse.dart';
import 'package:learn_it/presentation/screens/home/product%20design/widgets/courseimage.dart';
import 'package:learn_it/presentation/screens/home/product%20design/widgets/floatingaction.dart';
import 'package:learn_it/presentation/screens/home/product%20design/widgets/lesson.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class Coursepreview extends StatelessWidget {
  const Coursepreview({super.key, required this.document});
  final Map<String, dynamic> document;
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
              ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Lesson(
                        played: index==0? false : true,
                        description: document['discriptions'][index],
                        url: document['links'][index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: document['links'].length),
                  const SizedBox(height: 100
                  ,)
            ],
          ),
        )),
        floatingActionButton: const Buyfltbtn());
  }
}
