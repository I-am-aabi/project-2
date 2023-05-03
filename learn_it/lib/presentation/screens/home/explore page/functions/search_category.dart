import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

TextEditingController categorycontroller = TextEditingController();


Stream categoryget () async* {
   final newsnap = await FirebaseFirestore.instance
        .collection('courses')
        .where('category', isEqualTo: categorycontroller.text)
        .get();
    List courselist = newsnap.docs.map((e) => e.data()).toList();
    yield  courselist;
}
