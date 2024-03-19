import 'package:flutter/material.dart';
import 'package:zen_app/utils/colors.dart';
import 'package:zen_app/widgets/AddedPoints/added_points_card.dart';

class AddedPoints extends StatefulWidget {
  AddedPoints({Key? key});

  @override
  State<AddedPoints> createState() => _AddedPointsState();
}

class _AddedPointsState extends State<AddedPoints> {
  var height, width;

  bool hasValue = true;

  List<String> listsData = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.853,
      height: height * 0.4,
      child: hasValue
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listsData.length,
              itemBuilder: (context, index) {
                return Container(
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: width * 0.1, vertical: 5),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 222, 232, 222)),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("location"),
                              SizedBox(width: width * 0.53),
                               Text("10pts"),
                            ],
                          ),
                          Text("date"),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
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
                Text("No points added yet")
              ],
            ),
    );
  }
}
