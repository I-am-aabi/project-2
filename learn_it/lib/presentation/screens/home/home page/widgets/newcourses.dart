import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_it/presentation/screens/home/home%20page/functions/newcoursesget.dart';

class Newcourses extends StatefulWidget {
  const Newcourses({super.key});

  @override
  State<Newcourses> createState() => _NewcoursesState();
}

class _NewcoursesState extends State<Newcourses> {
  StreamSubscription<List<dynamic>>? _subscription;
  @override
  void initState() {
    _subscription = getnewcourses().listen((event) {});
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Container mycontainer = Container(
      height: 180,
      width: 240,
      decoration: BoxDecoration(
          color: Colors.blue.shade50, borderRadius: BorderRadius.circular(20)),
      child: const SizedBox(
          height: 50,
          width: 50,
          child: SpinKitCircle(
            color: Colors.blue,
          )),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'New courses',
          style: TextStyle(fontSize: 20, fontFamily: 'PoppinsMedium'),
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: getnewcourses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> course =
                            snapshot.data![index];
                        return Newcoursecard(
                            img: course['imgurl'], title: course['title']);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: 3,
                    ),
                  );
                }
              }
              return SizedBox(
                height: 180,
                width: 240,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return mycontainer;
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: 3,
                ),
              );
            })
      ],
    );
  }
}

class Newcoursecard extends StatelessWidget {
  const Newcoursecard({super.key, required this.img, required this.title});
  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 240,
      decoration: BoxDecoration(
          color: Colors.blue.shade50, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 120,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      img,
                      fit: BoxFit.fill,
                    ))),
                Text(title,style: const TextStyle(fontSize: 14,fontFamily: 'Poppinsthin'),)
          ],
        ),
      ),
    );
  }
}
