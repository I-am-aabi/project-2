import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_it/presentation/screens/home/favorites/functions/getfavorites.dart';
import 'package:learn_it/presentation/screens/home/favorites/widgets/nofavorites.dart';
import 'package:learn_it/presentation/screens/home/result/widgets/result_card.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class Favoritespage extends StatelessWidget {
  const Favoritespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Heading(heading: 'Favorites'),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: getfavorites(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SpinKitCircle(
                    color: Colors.blue,
                  );
                }
                if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return snapshot.data!.isEmpty
                        ? const Nofav()
                        : Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  final documentSnapshot =
                                      snapshot.data![index][0];
                                  return Resultcard(
                                    documentSnapshot: documentSnapshot,
                                    color: index,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: snapshot.data![0].length),
                          );
                  }
                }
                return const Text('Some errot occured');
              },
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
