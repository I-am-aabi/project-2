import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_it/core/colors.dart';
import 'package:learn_it/presentation/screens/home/payment/widgets/fields.dart';
import 'package:learn_it/presentation/screens/home/widgets/heading.dart';
import 'package:learn_it/presentation/screens/home/widgets/navigation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Paypage extends StatefulWidget {
  const Paypage(
      {super.key, required this.amount, required this.title, required this.id});
  final String amount;
  final String title;
  final String id;
  @override
  State<Paypage> createState() => _PaypageState();
}

class _PaypageState extends State<Paypage> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  Future<void> generate_ODID() async {
    var orderOptions = {
      'amount': 50000, // amount in the smallest currency unit
      'currency': "INR",
      'receipt': "order_rcptid_11"
    };
    final client = HttpClient();
    final request =
        await client.postUrl(Uri.parse('https://api.razorpay.com/v1/orders'));
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('${'rzp_test_EpmS4rp090qIXJ'}:${'9wqyukiYozGYt6mGfNw7VYOt'}'))}';
    request.headers.set(HttpHeaders.authorizationHeader, basicAuth);
    request.add(utf8.encode(json.encode(orderOptions)));
    final response = await request.close();
    response.transform(utf8.decoder).listen((contents) {
      // print('ORDERID' + contents);
      String orderId = contents.split(',')[0].split(":")[1];
      orderId = orderId.substring(1, orderId.length - 1);
      Fluttertoast.showToast(
          msg: "ORDERID: $orderId", toastLength: Toast.LENGTH_SHORT);
      Map<String, dynamic> checkoutOptions = {
        'key': 'rzp_test_EpmS4rp090qIXJ',
        'amount': int.parse(widget.amount) * 100,
        'name': 'Courserer',
        'description': 'Fssai Registrtion Charge',
        'prefill': {'contact': '8910407549', 'email': 'xx.xx@gmail.com'},
        'external': {
          'wallets': ['paytm']
        }
      };
      try {
        _razorpay.open(checkoutOptions);
      } catch (e) {
        // print(e.toString());
      }
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot<Map<String, dynamic>> students = await FirebaseFirestore
        .instance
        .collection('students')
        .where('uid', isEqualTo: user!.uid)
        .limit(1)
        .get();
    final List student = students.docs.map((e) => e.data()).toList();
    final List<dynamic> subscriptions = student[0]['subscriptions'];
    final List<dynamic> fav = student[0]['favorites'];
    subscriptions.add(widget.id);
    FirebaseFirestore.instance
        .collection('students')
        .doc(user.displayName! + user.uid)
        .update({
      'subscriptions': subscriptions,
      'name': user.displayName,
      'uid': user.uid,
      'favorites': fav
    });
    Fluttertoast.showToast(
        msg: 'course added to subscription',
        backgroundColor: const Color.fromARGB(255, 29, 212, 47));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Navbar(),
        ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'some error occured in payment',
        backgroundColor: const Color.fromARGB(255, 226, 21, 21));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // print('payment some');
  }
  addsubscription() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Heading(heading: 'Payment'),
                const SizedBox(
                  height: 20,
                ),
                Payinfo(
                  title: widget.title,
                  head: 'Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                Payinfo(
                  title: '${widget.amount}₹',
                  head: 'Price',
                ),
                const SizedBox(height: 20),
                Payinfo(
                  title: '${widget.amount}.00₹',
                  head: 'Total',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: loginbt,
                    fixedSize: const Size(160.0, 40.0),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    generate_ODID();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signUpbt,
                    fixedSize: const Size(160.0, 40.0),
                  ),
                  child: const Text(
                    "Pay now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
