import 'package:flutter/material.dart';
import 'package:zen_app/utils/colors.dart';

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
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
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
                child: Icon(Icons.person_2_outlined, size: 35.0, color: Colors.black.withOpacity(0.5),),
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
              child: Icon(Icons.notifications_none, size: 35.0, color: Colors.black.withOpacity(0.5)),
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: zenGreen),
              height: 120,
              width: 300,
              // color: zenGreen,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('1800', style: TextStyle(fontSize: 25, color: Colors.white)),
                      Text('1800', style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                   Icon(Icons.add_circle_outline, color: Colors.white,size: 70, ),
                  
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text('hello')
        ],
      )
    );
  }
}