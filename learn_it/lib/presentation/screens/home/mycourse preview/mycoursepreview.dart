

import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/aboutcourse.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/courseimage.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/widgets/floatingaction.dart';
import 'package:learn_it/presentation/screens/home/mycourses%20course%20player/widgets/mylessons.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class MyCoursepreview extends StatefulWidget {
  const MyCoursepreview({
    super.key,
    required this.document,
  });
  final Map<String, dynamic> document;

  @override
  State<MyCoursepreview> createState() => _MyCoursepreviewState();
}

class _MyCoursepreviewState extends State<MyCoursepreview> {
  final ScrollController _innerScrollController = ScrollController();
  final ScrollController _outerScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _innerScrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _innerScrollController.dispose();
    _outerScrollController.dispose();

    super.dispose();
  }

  void _scrollListener() {
    if (_innerScrollController.position.atEdge) {
      if (_innerScrollController.position.pixels == 0) {
        // Reached the top
      } else {
        // Reached the bottom
        _outerScrollController.animateTo(
          _outerScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            controller: _innerScrollController,
            children: [
              Courseimg(url: widget.document['imgurl']),
              Padding(
                padding: const EdgeInsets.only(left: 3.0, top: 5),
                child: Heading(heading: widget.document['title']),
              ),
              const SizedBox(
                height: 5,
              ),
              Aboutcourse(
                  discription: widget.document['discription'],
                  lectures: widget.document['lectures']),
              const SizedBox(
                height: 20,
              ),
              const Text(' Lectures',
                  style: TextStyle(fontSize: 20, fontFamily: 'PoppinsMedium')),
              const SizedBox(
                height: 15,
              ),
              widget.document['links'].length == 0
                  ? Image.asset('assets/images/nolectures.png')
                  : ListView.separated(
                      controller: _outerScrollController,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MyLesson(
                          courseid: widget.document['videoid'],
                            player: false,
                            document: widget.document,
                            description: widget
                                .document['discriptions'][index],
                            url: widget.document['links'][index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: widget.document['links'].length),
              const SizedBox(
                height: 150,
              )
            ],
          ),
        )),
        floatingActionButton: const Buyfltbtn(
          visible: false,
        ));
  }
}
