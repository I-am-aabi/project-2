import 'package:flutter/material.dart';

class Loginwith extends StatefulWidget {
  Loginwith({
    super.key,
  });

  @override
  State<Loginwith> createState() => _LoginwithState();
}

class _LoginwithState extends State<Loginwith> {
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              fixedSize: MaterialStateProperty.all(const Size(250, 40)),
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  )),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.black),
              )
            ],
          )),
    );
  }

 
}
