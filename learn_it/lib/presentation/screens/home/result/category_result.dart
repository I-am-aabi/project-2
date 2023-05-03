import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_it/presentation/screens/home/result/widgets/noresult.dart';
import 'package:learn_it/presentation/screens/home/result/widgets/result_card.dart';
import 'package:learn_it/presentation/screens/home/explore%20page/functions/search_category.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class Catresult extends StatefulWidget {
  Catresult({
    super.key,
  });

  @override
  State<Catresult> createState() => _CatresultState();
}

class _CatresultState extends State<Catresult> {
  StreamSubscription? _subscription;
  @override
  void initState() {
    _subscription = categoryget().listen((event) {});
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

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
                StreamBuilder(
                    stream: categoryget(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active ||
                          snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isEmpty
                              ? const Noresult()
                              : Expanded(
                                  child: ListView.separated(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      final Map<String, dynamic>
                                          documentSnapshot =
                                          snapshot.data[index];
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
                                );
                        }
                       
                      }
                       return const Center(
                         child: SpinKitCircle(
                            color: Colors.blue,
                          ),
                       );
                    }),
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
