import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';
import 'package:learn_it/presentation/screens/home/result/category_result.dart';
import 'package:learn_it/presentation/screens/home/explore%20page/functions/search_category.dart';

class Categoryimg extends StatelessWidget {
  const Categoryimg(
      {super.key,
      required this.path,
      required this.subject,
      required this.color});
  final String subject;
  final String path;
  final int color;
  @override
  Widget build(BuildContext context) {
    getColor(color);
    return GestureDetector(
        onTap: () async {
          categorycontroller.text = subject;
          // List<dynamic> courseList =await categoryget();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Catresult(),
              ));
        },
        child: Column(
          children: [
            Container(
              height: 140,
              width: 160,
              decoration: BoxDecoration(
                  color: containerclr, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 120,
                  width: 140,
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(31, 0, 70, 191),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      path,
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              subject,
              style: TextStyle(
                  fontSize: 18,
                  color: catgtextclr,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
