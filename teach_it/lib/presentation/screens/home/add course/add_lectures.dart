import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/home/add%20course/lecture_field.dart';

class Addlectures extends StatelessWidget {
  Addlectures(
      {super.key, required this.heading, required this.documentSnapShot});
  final String heading;
  final DocumentSnapshot documentSnapShot;
  final CollectionReference dbRef =
      FirebaseFirestore.instance.collection('courses');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(heading)),
        actions: [
          IconButton(
              onPressed: (() {
                dbRef.doc(heading).delete();
                Navigator.pop(context);
              }),
              icon: const Icon(Icons.delete))
        ],
      ),
      body: StreamBuilder(
        stream: dbRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: documentSnapShot['links'].length,
              itemBuilder: (context, index) {
                return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                          documentSnapShot['discriptions'][index].toString()),
                    ));
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
                builder: (context) => Lecturefield(
                    title: heading, documentSnapShot: documentSnapShot),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
