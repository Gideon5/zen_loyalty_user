import 'package:flutter/material.dart';

class RedeemedPoints extends StatefulWidget {
  const RedeemedPoints({super.key});

  @override
  State<RedeemedPoints> createState() => _RedeemedPointsState();
}

class _RedeemedPointsState extends State<RedeemedPoints> {
    bool hasValue = false;
    List <String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
     return Container(
      child: hasValue
          ? Text('This is the added points pag from comp..........')
          : Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/box.png",
                  height: 250,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("No points redeemed yet")
              ],
            ),
    );
  }
}
