import 'package:flutter/material.dart';

class AddedPointsCard extends StatefulWidget {
  const AddedPointsCard({super.key, required String listsData});

  @override
  State<AddedPointsCard> createState() => _AddedPointsCardState(listData: []);
}

class _AddedPointsCardState extends State<AddedPointsCard> {
  @override
  final List<String> listData;

  _AddedPointsCardState({required this.listData});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('List ${listData[0]}'),
          ),
          Divider(),
          ListView.builder(
            itemCount: listData.length,
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listData[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}