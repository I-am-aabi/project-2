import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

TextEditingController categorycontroller = TextEditingController();

final streamController = StreamController<List<dynamic>>();

 categoryget () async {
   final newsnap = await FirebaseFirestore.instance
        .collection('courses')
        .where('category', isEqualTo: categorycontroller.text)
        .get();
    List courselist = newsnap.docs.map((e) => e.data()).toList();
    return  courselist;
}
