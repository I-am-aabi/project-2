import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Heading(heading: 'Explore courses'),
        IconButton(onPressed: (() {}), icon: const Icon(Icons.search_rounded))
      ],
    );
  }
}
