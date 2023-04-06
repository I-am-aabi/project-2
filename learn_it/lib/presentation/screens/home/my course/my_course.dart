import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_it/presentation/screens/home/my%20course/functions/getmycourses.dart';
import 'package:learn_it/presentation/screens/home/my%20course/widgets/course_progress.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  StreamSubscription<List<dynamic>>? _subscription;

  @override
  void initState() {
    _subscription = getmycourses().listen((courses) {});
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

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
                  Expanded(
                    child: StreamBuilder(
                        stream: getmycourses(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return  const SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: SpinKitCircle(
                                  size: 100,
                                 color: Colors.blue,
                                ));
                          } else if (snapshot.connectionState ==
                                  ConnectionState.done ||
                              snapshot.connectionState ==
                                  ConnectionState.active) {
                            if (snapshot.hasError) {}
                            if (snapshot.hasData) {
                              return ListView.separated(
                                  itemBuilder: (context, index) {
                                    final documentSnapshot1 =
                                        snapshot.data[index + index][0];
                                    final documentSnapshot2 =
                                        index + index + 1 < snapshot.data.length
                                            ? snapshot.data[index + index + 1]
                                                [0]
                                            : null;
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Coursecard(
                                          videoid: documentSnapshot1['videoid'],
                                            documentsnapshot:
                                                documentSnapshot1,
                                            color: index + index),
                                        documentSnapshot2 == null
                                            ? const SizedBox(
                                                height: 180,
                                                width: 180,
                                              )
                                            : Coursecard(
                                              videoid: documentSnapshot2['videoid'],
                                                documentsnapshot:
                                                    documentSnapshot2,
                                                color: index + index + 1),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 50,
                                    );
                                  },
                                  itemCount: snapshot.data.length ~/ 2);
                            }
                          } else {}
                          return const SizedBox(
                              height: 200, width: 200, child: Text('error'));
                        }),
                  ),
                ],
              ))),
    );
  }
}
