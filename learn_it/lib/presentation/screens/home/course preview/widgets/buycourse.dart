import 'package:flutter/material.dart';

buycoursemsg(BuildContext context) {
  {
    Widget cancelButton = TextButton(
      child: const Text(
        "Cancel",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "Continue",
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () {},
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.blue.shade50,
      title: const Text("BUY NOW"),
      content: SizedBox(
        height: 190,
        child: Column(
          children: [
            const Text("Buy this course to unlock this content",style: TextStyle(fontFamily: 'PoppinsMedium'),),
            const SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/buynow.png'))
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
