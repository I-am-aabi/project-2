import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/course_preview.dart';

onMycourse(context , documentsnapshot) {
  Navigator.push(
      context, MaterialPageRoute(builder: ((context) =>  Coursepreview(document: documentsnapshot,locked: true,))));
}
