import 'package:flutter/material.dart';
class Coursepro3 extends StatelessWidget {
  const Coursepro3({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 180,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(20)
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const SizedBox(height: 10,),
            const SizedBox(height: 50,width: 100,child: Text('Visual Design',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),),),
            const SizedBox(height: 15,),

            LinearProgressIndicator(
              color: Colors.red.shade400,
              backgroundColor: Colors.white,
              value: 0.6,
              minHeight: 6,
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: const [Text('completed',
                style: TextStyle(fontSize: 12),),
                Text('10/16',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)],),
                IconButton(onPressed: (() {
                  
                }), icon: const Icon(Icons.play_circle,
                color: Colors.red,
                size: 50,))
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}