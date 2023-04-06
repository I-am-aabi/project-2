import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';
import 'package:learn_it/presentation/screens/home/my%20course/functions/navigations/productcourse.dart';

class Coursecard extends StatelessWidget {
  const Coursecard(
      {super.key, required this.documnectsnapshot, required this.color});
  final Map<String, dynamic> documnectsnapshot;

  final int color;
  @override
  Widget build(BuildContext context) {
    getColor(color);
    return GestureDetector(
      child: Container(
        height: 210,
        width: 160,
        decoration: BoxDecoration(
            color: containerclr, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                width: 110,
                child: Text(
                  documnectsnapshot['title'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  color: catgtextclr,
                  backgroundColor: Colors.white,
                  value: 0.583,
                  minHeight: 6,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'completed',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '14/${documnectsnapshot['lectures']}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: (() {
                        // onMycourse(context);
                      }),
                      icon: Icon(
                        Icons.play_circle,
                        color: catgtextclr,
                        size: 50,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
