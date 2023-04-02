import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/my%20course/functions/navigations/productcourse.dart';

class Coursepro1 extends StatelessWidget {
  const Coursepro1({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 180,
        width: 160,
        decoration: BoxDecoration(
           boxShadow: [BoxShadow(blurRadius: 1,color: Colors.green.withOpacity(0.7)),],
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 50,
                width: 100,
                child: Text(
                  'Product Design v1.0',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              LinearProgressIndicator(
                color: Colors.green.shade400,
                backgroundColor: Colors.white,
                value: 0.583,
                minHeight: 6,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text(
                        'completed',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '14/24',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: (() {
                        // onMycourse(context);
                      }),
                      icon: const Icon(
                        Icons.play_circle,
                        color: Colors.green,
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
