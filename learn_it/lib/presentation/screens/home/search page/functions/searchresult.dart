import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

TextEditingController searchcontroller = TextEditingController();

Stream searchget() async* {
  final newsnap = await FirebaseFirestore.instance
      .collection('courses')
      .where("title", isGreaterThanOrEqualTo: searchcontroller.text)
      .where("title", isLessThanOrEqualTo: "${searchcontroller.text}\uf7ff")
      .get();
  List courselist = newsnap.docs.map((e) => e.data()).toList();

  yield courselist;
}
