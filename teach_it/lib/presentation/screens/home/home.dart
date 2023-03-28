import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/starting%20page/starting_page.dart';
import 'package:teach_it/presentation/screens/home/add%20course/add_course.dart';
import 'package:teach_it/presentation/screens/home/add%20course/add_lectures.dart';

class Yourcourses extends StatelessWidget {
  Yourcourses({super.key});
  final CollectionReference dbRef =
      FirebaseFirestore.instance.collection('teachers');
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    dbRef.doc(user!.uid).set({'name': user!.displayName});
    final CollectionReference newRef =
        dbRef.doc(user!.uid).collection('courses');
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Your courses'),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StartingPage(),
                    ));
              }),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: newRef.snapshots(),
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
                              documentSnapShot: documentSnapshot,
                              dbRef: newRef),
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
                builder: (context) => Addcourse(databaseRef: newRef),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
