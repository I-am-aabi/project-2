import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/starting%20page/functions/Checklogin.dart';
import 'package:learn_it/presentation/screens/getting%20started/landing_page/landing_page_1.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckfirstScreen extends StatelessWidget {
  const CheckfirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: checkFirstScreen,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('snap shot error');
          } else if (snapshot.hasData) {
            if (snapshot.data == true) {
              return const Checklogininfo();
            } else {
              return const Landing1();
            }
          }
        }
        return const Text('some error');
      },
    );
  }
}



Stream checkFirstScreen = (() async* {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = (prefs.getBool('seen') ?? false);

  if (seen == true) {
    yield true;
  } else {
    await prefs.setBool('seen', true);
    yield false;
  }
})();
