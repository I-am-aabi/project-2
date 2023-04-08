import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<dynamic>> getnewcourses () async* {
  final QuerySnapshot<Map<String, dynamic>> courses = await FirebaseFirestore
      .instance
      .collection('courses')
      .limit(3)
      .get();
  final List result = courses.docs.map((e) => e.data()).toList();
  yield result;
}