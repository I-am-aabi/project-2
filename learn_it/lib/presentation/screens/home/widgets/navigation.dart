import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';
import 'package:learn_it/presentation/screens/home/home%20page/home.dart';
import 'package:learn_it/presentation/screens/home/my%20course/my_course.dart';
import 'package:learn_it/presentation/screens/home/profile/profile.dart';
import 'package:learn_it/presentation/screens/home/search%20page/serach.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

final pageList = [
  const HomePage(),
  const CoursePage(),
  const SearchPage(),
  const ProfilePage(),
];

int currentpage = 0;

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageList.elementAt(currentpage),
        bottomNavigationBar: MoltenBottomNavigationBar(
           barColor: navbar,
            tabs: [MoltenTab(icon: const Icon(Icons.home_filled)),
            MoltenTab(icon: const Icon(Icons.play_circle_outline)),
            MoltenTab(icon: const Icon(Icons.search_rounded)),
            MoltenTab(icon: const Icon(Icons.account_circle_outlined))],
            selectedIndex: currentpage,
            onTabChange: ((index) {
              setState(() {
                currentpage = index;
              });
            }))
        );
  }
}
