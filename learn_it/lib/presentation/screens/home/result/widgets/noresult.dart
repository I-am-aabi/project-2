import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Noresult extends StatelessWidget {
  const Noresult({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 120,),
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.asset('assets/images/nodata.png')),
                      const Text('No courses in this category, check again later',style: TextStyle(
                        fontFamily: 'PoppinsMedium',
                        fontSize: 22
                      ),
                      textAlign: TextAlign.center,)
                  ],
                ));
  }
}