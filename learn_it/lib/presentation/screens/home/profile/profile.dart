import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';
import 'package:learn_it/presentation/screens/home/profile/widgets/profile_pic.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';
import 'package:learn_it/presentation/screens/home/profile/widgets/textbtn.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
            SizedBox(
              height: 10,
            ),
            Heading(heading: 'Account'),
            SizedBox(height: 20,),
            Profilepic(),
            SizedBox(height: 15,),
            Textbtn(text: 'Favorites'),
            SizedBox(height: 10,),
             Textbtn(text: 'Edit account'),
            SizedBox(height: 10,),
             Textbtn(text: 'Privacy&policy'),
            SizedBox(height: 10,),
             Textbtn(text: 'Log out'),
            SizedBox(height: 10,),

        ],
      ),
          )),
    );
  }
}
