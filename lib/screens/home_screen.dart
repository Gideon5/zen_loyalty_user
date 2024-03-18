import 'package:flutter/material.dart';
import 'package:zen_app/screens/qrcode_screen.dart';
import 'package:zen_app/utils/colors.dart';
import 'package:zen_app/widgets/top_tab_view.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Welcome Gideon',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: zenGreen),
                height: 145,
                width: 355,
                // color: zenGreen,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Points',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('1800',
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => QrcodeScreen()));
                              },
                              child: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 70,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TopTabView()
          ],
        ));
  }
}
