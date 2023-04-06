import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Buyfltbtn extends StatelessWidget {
  const Buyfltbtn({super.key, required this.visible});
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.favorite),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15),
                child:
                
                visible ?
                 SizedBox(
                  width: 160,
                  height: 55,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    child: const Text(
                      'buy now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ):                 SizedBox(
                  width: 160,
                  height: 55,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    child: const Text(
                      'play now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ),
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
