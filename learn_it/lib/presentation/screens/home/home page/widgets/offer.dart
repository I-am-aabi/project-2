import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Offercourse extends StatelessWidget {
  Offercourse({super.key});
  List<String> images = [
    'assets/images/off1.png',
    'assets/images/off2.png',
    'assets/images/off3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8),
      child: CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(images[index],fit: BoxFit.contain,));
          },
          options: CarouselOptions(
            height: 220,
            autoPlay: true
          )),
    );
  }
}
