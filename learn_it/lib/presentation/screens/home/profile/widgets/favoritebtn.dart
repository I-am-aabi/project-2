import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/favorites/favorites.dart';

class Favbtn extends StatelessWidget {
  const Favbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Favoritespage(),
              ));
        },
        child: const SizedBox(
          height: 40,
          child: Text(
            'Favorites',
            style: TextStyle(fontSize: 18, fontFamily: 'PoppinsMedium'),
          ),
        ));
  }
}
