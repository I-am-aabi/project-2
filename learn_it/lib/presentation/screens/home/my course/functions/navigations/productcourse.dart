import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/course%20preview/course_preview.dart';

oncourse(context , documentsnapshot,bool locked) {
  Navigator.push(
      context, MaterialPageRoute(builder: ((context) =>  Coursepreview(document: documentsnapshot,locked: locked,))));
}
