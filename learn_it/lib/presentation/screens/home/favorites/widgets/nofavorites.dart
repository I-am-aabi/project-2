import 'package:flutter/cupertino.dart';
class Nofav extends StatelessWidget {
  const Nofav({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: 300,
        child: Column(
          children: [
            Image.asset('assets/images/favorites.png'),
            const Text(
              'You don\'t have any favorites',
              style: TextStyle(fontSize: 15, fontFamily: 'PoppinsMedium'),
            )
          ],
        ),
      ),
    );
  }
}
