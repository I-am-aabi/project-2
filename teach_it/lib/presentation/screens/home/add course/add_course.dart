import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addcourse extends StatelessWidget {
  Addcourse({super.key});
  final titlecontroller = TextEditingController();
  final discriptioncontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final CollectionReference databaseRef = FirebaseFirestore.instance.collection('courses');
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
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: titlecontroller,
                  autofocus: true,
                  maxLength: 20,
                  decoration: const InputDecoration(
                      hintText: ' Course Title',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 3, left: 2)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: pricecontroller,
                    
                    maxLength: 10,
                    decoration: const InputDecoration(
                        hintText: 'Price',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 6, left: 5)),
                  )),
            ),
             Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: discriptioncontroller,
                    maxLines: 20,
                    maxLength: 500,
                    decoration: const InputDecoration(
                        hintText: 'Discription',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 10, left: 5)),
                  )),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          databaseRef.doc(titlecontroller.text.toString()).set({
            'title': titlecontroller.text.toString(),
            'discription': discriptioncontroller.text.toString(),
            'links': [] ,
            'discriptions': [],
            'price' : pricecontroller.text.toString()
            // 'links': ['434''ihwiuher']
          });
          titlecontroller.clear();
          discriptioncontroller.clear();
          Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
