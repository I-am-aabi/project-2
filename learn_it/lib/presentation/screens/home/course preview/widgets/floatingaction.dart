import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_it/presentation/screens/home/payment/payment_screen.dart';

class Buyfltbtn extends StatefulWidget {
  const Buyfltbtn({super.key, required this.visible, required this.videoid, required this.price, required this.title});
  final bool visible;
  final String videoid;
  final String price;
  final String title;
  @override
  State<Buyfltbtn> createState() => _BuyfltbtnState();
}

class _BuyfltbtnState extends State<Buyfltbtn> {
  bool? fav;
  @override
  void initState() {
    fav = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                Widget>[
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () async {
                setState(() {
                  fav = !fav!;
                });
                await favoriteschange(widget.videoid);
              },
              child: Icon(Icons.favorite,
                  color: fav! ? Colors.blue.shade700 : Colors.white)),
          Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15),
              child: widget.visible
                  ? SizedBox(
                      width: 160,
                      height: 55,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  Paypage(amount: widget.price, title: widget.title,),
                              ));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                        ),
                        child: const Text(
                          'buy now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 160,
                      height: 55,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                        ),
                        child: const Text(
                          'play now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
          FloatingActionButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp])
                  .then((value) => Navigator.pop(context));
            },
            child: const Icon(Icons.arrow_back),
          )
        ] // button second
            ),
      ),
    );
  }
}

getfavorites(videoid) async* {
  final user = FirebaseAuth.instance.currentUser;
  final student = await FirebaseFirestore.instance
      .collection('students')
      .where('uid', isEqualTo: user!.uid)
      .get();
  final List studentdata = student.docs.map((e) => e.data()).toList();
  final List favorites = studentdata[0]['favorites'];
  if (favorites.contains(videoid)) {
    yield true;
  } else {
    yield false;
  }
}

favoriteschange(videoid) async {
  final user = FirebaseAuth.instance.currentUser;
  final student = await FirebaseFirestore.instance
      .collection('students')
      .where('uid', isEqualTo: user!.uid)
      .get();
  final List studentdata = student.docs.map((e) => e.data()).toList();
  List favorites = studentdata[0]['favorites'];
  if (favorites.contains(videoid)) {
    favorites.remove(videoid);
    await FirebaseFirestore.instance
        .collection('students')
        .doc(user.displayName! + user.uid)
        .update({'favorites': favorites});
  } else {
    favorites.add(videoid);
    await FirebaseFirestore.instance
        .collection('students')
        .doc(user.displayName! + user.uid)
        .update({'favorites': favorites});
  }
}
