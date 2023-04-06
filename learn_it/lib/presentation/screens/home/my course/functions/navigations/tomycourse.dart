import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/mycourse%20preview/mycoursepreview.dart';

onMycourse(context,document) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyCoursepreview(
          document: document,
        ),
      ));
}
