import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lecturefield extends StatelessWidget {
  Lecturefield(
      {super.key,
      required this.title,
      required this.documentSnapShot,
      required this.databaseRef});
  final String title;
  final DocumentSnapshot documentSnapShot;
  final titlecontroller = TextEditingController();
  final linkcontroller = TextEditingController();
  final CollectionReference databaseRef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Course')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    backgroundBlendMode: BlendMode.darken,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: titlecontroller,
                  autofocus: true,
                  maxLength: 35,
                  decoration: const InputDecoration(
                      hintText: ' lecture Title',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 3, left: 2)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: linkcontroller,
                    maxLines: 1,
                    maxLength: 50,
                    decoration: const InputDecoration(
                        hintText: 'link',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 10, left: 5)),
                  )),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List links = documentSnapShot['links'];
          links.add(
              '${(links.length + 1).toString()} ${'.'}${titlecontroller.text.toString()}');
          List discriptions = documentSnapShot['discriptions'];
          discriptions.add(linkcontroller.text.toString());
          databaseRef
              .doc(title)
              .update({'discriptions': links, 'links': discriptions});
          titlecontroller.clear();
          linkcontroller.clear();
          Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
