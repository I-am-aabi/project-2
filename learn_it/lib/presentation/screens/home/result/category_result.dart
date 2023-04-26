import 'package:flutter/material.dart';
import 'package:learn_it/presentation/screens/home/result/widgets/noresult.dart';
import 'package:learn_it/presentation/screens/home/result/widgets/result_card.dart';
import 'package:learn_it/presentation/screens/home/explore%20page/functions/search_category.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class Catresult extends StatelessWidget {
  Catresult({
    super.key,
    required this.courselist,
  });
  final List<dynamic> courselist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading(heading: categorycontroller.text),
                const SizedBox(
                  height: 10,
                ),
                courselist.isEmpty
                    ? const Noresult()
                    : Expanded(
                        child: ListView.separated(
                          itemCount: courselist.length,
                          itemBuilder: (context, index) {
                            final Map<String, dynamic> documentSnapshot =
                                courselist[index];
                            return Resultcard(
                             documentSnapshot: documentSnapshot,
                              color: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                        ),
                      ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
