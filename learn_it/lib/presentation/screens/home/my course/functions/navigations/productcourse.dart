import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/product%20design/course_preview.dart';

onMycourse(context , documentsnapshot) {
  Navigator.push(
      context, MaterialPageRoute(builder: ((context) =>  Coursepreview(document: documentsnapshot,))));
}
