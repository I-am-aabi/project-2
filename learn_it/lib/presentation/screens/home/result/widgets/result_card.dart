import 'package:flutter/material.dart';
import 'package:learn_it/core/colors.dart';
import 'package:learn_it/presentation/screens/home/my%20course/functions/navigations/productcourse.dart';

class Resultcard extends StatelessWidget {
  const Resultcard(
      {super.key, required this.documentSnapshot, required this.color});

  final int color;
  final Map<String, dynamic> documentSnapshot;
  @override
  Widget build(BuildContext context) {
    getColor(color);
    return GestureDetector(
      onTap: () => oncourse(context, documentSnapshot,true),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
            color: containerclr, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(documentSnapshot['imgurl'],
                          fit: BoxFit.fill,errorBuilder:
                        (BuildContext context, Object exception, stackTrace) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.wifi_off,
                              color: Colors.black,
                            ),
                            Text(
                              'Check your network connection',
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 1,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        documentSnapshot['title'],
                        style: const TextStyle(
                            fontSize: 18, fontFamily: 'PoppinsMedium'),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${documentSnapshot['lectures']} lectures',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                         Text(
                          '₹ ${documentSnapshot['price']}',
                          style:
                              const TextStyle(fontSize: 22, fontFamily: 'PoppinsBold'),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
