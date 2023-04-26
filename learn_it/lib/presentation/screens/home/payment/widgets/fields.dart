import 'package:flutter/cupertino.dart';

class Payinfo extends StatelessWidget {
  const Payinfo({super.key, required this.title, required this.head});
  final String title;
  final String head;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          head,
          style: const TextStyle(
            fontFamily: 'PoppinsMedium',
            fontSize: 18,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppinsthin',
              fontSize: 18,
            ),
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
