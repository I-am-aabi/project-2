import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/widgets/navigation.dart';

onHome(context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: ((context) => const Navbar())));
}
