import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrcodeScreen extends StatefulWidget {
  const QrcodeScreen({super.key});

  @override
  State<QrcodeScreen> createState() => _QrcodeScreenState();
}

class _QrcodeScreenState extends State<QrcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Welcome Gideon',
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18),
          //   ),
          // ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          // centerTitle: true,
          leading: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  child: Icon(
                    Icons.person_2_outlined,
                    size: 35.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffF7F8F8),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 30,
                height: 30,
                child: Icon(Icons.notifications_none,
                    size: 35.0, color: Colors.black.withOpacity(0.5)),
                decoration: BoxDecoration(
                    color: Color(0xffF7F8F8),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  'Receive Points',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  QrImageView(
                    data: '1234567890',
                    version: QrVersions.auto,
                    size: 250.0,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
