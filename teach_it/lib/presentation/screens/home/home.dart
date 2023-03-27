import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/home/add%20course/add_course.dart';
import 'package:teach_it/presentation/screens/home/add%20course/add_lectures.dart';

class Yourcourses extends StatelessWidget {
  Yourcourses({super.key});
  final CollectionReference dbRef =
      FirebaseFirestore.instance.collection('courses');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Your courses'))),
      body: StreamBuilder(
        stream: dbRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Addlectures(
                              heading: documentSnapshot['title'],
                              documentSnapShot: documentSnapshot),
                        ));
                  },
                  child: Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(documentSnapshot['title']),
                      )),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addcourse(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
