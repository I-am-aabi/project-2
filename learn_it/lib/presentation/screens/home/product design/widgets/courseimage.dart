import 'package:flutter/cupertino.dart';

class Courseimg extends StatelessWidget {
  const Courseimg({super.key,required this.url});
final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              url,
              fit: BoxFit.fill,
            )));
  }
}
