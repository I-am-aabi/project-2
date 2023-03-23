import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/authenticate/starting%20page/functions/check%20_seen.dart';
import 'package:learn_it/presentation/screens/authenticate/starting%20page/starting_page.dart';
import 'package:learn_it/presentation/screens/getting%20started/landing_page/widgets/landing_pages.dart';
import 'package:learn_it/presentation/screens/getting%20started/landing_page/widgets/continue_btn.dart';
import 'package:learn_it/presentation/screens/home/widgets/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Landing1 extends StatefulWidget {
  const Landing1({super.key});
  @override
  State<Landing1> createState() => _Landing1State();
}

class _Landing1State extends State<Landing1> {
  final PageController _pageController = PageController();

  int pageNum = 0;
  @override
  void initState() {
    _checkFirstSeen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (int i) {
            setState(() {
              pageNum = i;
            });
          },
          children: const [
            Page1(
                path: 'assets/images/l1.png',
                discription:
                    'Free courses for you to find your way for learning',
                heading: 'Numerous free trail course'),
            Page1(
                path: 'assets/images/l2.png',
                discription:
                    'Easy and fast learning at any time to help you improve varius skills',
                heading: 'Quick and easy learning'),
            Page1(
              path: 'assets/images/l3.png',
              discription:
                  'Study according to the study plan make study more motivated',
              heading: 'Create your own study plan',
            ),
          ],
        ),
        SafeArea(
            child: Center(
          child: Column(
            children: [
              const Spacer(),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue, dotWidth: 10, dotHeight: 10),
              ),
              pageNum == 2
                  ? const SizedBox(height: 190, child: Continuebtn())
                  : const SizedBox(
                      height: 190,
                    )
            ],
          ),
        ))
      ]),
    );
  }
}

_checkFirstSeen(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = (prefs.getBool('seen') ?? false);

  if (seen == true) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const StartingPage()));
  } else {
    await prefs.setBool('seen', true);
  }
}
