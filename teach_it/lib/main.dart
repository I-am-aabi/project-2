import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teach_it/presentation/screens/authentication/authenticate/starting%20page/starting_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
        debugShowCheckedModeBanner: false, home: StartingPage());
  }
}
