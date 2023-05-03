import 'package:flutter/cupertino.dart';

class Nocourses extends StatelessWidget {
  const Nocourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: 300,
        child: Column(
          children: [
            Image.asset('assets/images/courses.png'),
            const SizedBox(height: 10,),
            const Text(
              'You don\'t have any courses',
              style: TextStyle(fontSize: 18, fontFamily: 'PoppinsMedium'),
            )
          ],
        ),
      ),
    );
  }
}