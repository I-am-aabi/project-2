import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_it/presentation/screens/home/result/widgets/result_card.dart';
import 'package:learn_it/presentation/screens/home/search%20page/functions/searchresult.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  StreamSubscription<dynamic>? _subscription;

  @override
  void initState() {
    _subscription = searchget().listen((event) {});
   
    super.initState();
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
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchcontroller.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Heading(heading: 'Results'),
              Expanded(
                child: StreamBuilder(
                    stream: searchget(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: SpinKitCircle(
                              size: 100,
                              color: Colors.blue,
                            ));
                      } else if (snapshot.connectionState ==
                              ConnectionState.done ||
                          snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasError) {}
                        if (snapshot.hasData) {
                          return snapshot.data.isEmpty
                              ? const Center(child: Text('No results found',style: TextStyle(
                                fontFamily: 'PoppinsMedium',
                                fontSize: 22
                              ),))
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    final documentSnapshot =
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
                                  itemCount: snapshot.data.length);
                        }
                      }
                      return const SizedBox(
                          height: 200, width: 200, child: Text('error'));
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
