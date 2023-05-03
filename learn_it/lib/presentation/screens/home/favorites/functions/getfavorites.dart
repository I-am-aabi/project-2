import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Stream<List<dynamic>> getfavorites() async* {
  final user = FirebaseAuth.instance.currentUser;
  List<dynamic> results = [];
  final QuerySnapshot<Map<String, dynamic>> students =await FirebaseFirestore
      .instance
      .collection('students')
      .where('uid', isEqualTo: user!.uid)
      .limit(1)
      .get();

  final List student = students.docs.map((e) => e.data()).toList();
  final List<dynamic> favorites = student[0]['favorites'];

  for (int i = 0; i < favorites.length; i++) {
    final QuerySnapshot<Map<String, dynamic>> newsnap = await FirebaseFirestore
        .instance
        .collection('courses')
        .where('videoid', isEqualTo: favorites[i])
        .get();
    final List result = newsnap.docs.map((e) => e.data()).toList();
    results.add(result);
  }
  // print(results);
  yield results;
}
