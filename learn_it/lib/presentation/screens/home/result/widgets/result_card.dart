import 'package:flutter/material.dart';

class Resultcard extends StatelessWidget {
  const Resultcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
             children: [
          Container(
            width: 85,
            height: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 252, 252, 252),
                borderRadius: BorderRadius.circular(10)),
                child: Image.asset('assets/images/2.png'),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Product Design v1.0',
                  style: TextStyle(fontSize: 20),
                ),
                Text('16 lessons')
              ],
            ),
          ),
          IconButton(
            icon:
                Icon(Icons.play_circle, size: 50, color: Colors.blue.shade600),
            onPressed: () {},
            padding: EdgeInsets.zero,
          )
        ]),
      ),
    );
  }
}
