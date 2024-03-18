import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen_app/widgets/AddedPoints/added_points.dart';
import 'package:zen_app/widgets/RedeemedPoints/redeemed_points.dart';

class TopTabView extends StatefulWidget {
  const TopTabView({super.key});

  @override
  State<TopTabView> createState() => _TopTabViewState();
}

class _TopTabViewState extends State<TopTabView> {
  int? _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        CustomSlidingSegmentedControl<int>(
          initialValue: _currentValue,
          // groupValue: groupValue,
          children: {
            1: Text('Added Points'),
            2: Text('Redeemed Points'),
          },

          decoration: BoxDecoration(
            color: CupertinoColors.lightBackgroundGray,
            borderRadius: BorderRadius.circular(8),
          ),
          thumbDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: Offset(
                  0.0,
                  2.0,
                ),
              ),
            ],
          ),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInToLinear,
          onValueChanged: (int v) {
            setState(() {
              _currentValue = v;
            });
            print("this is the current  value $_currentValue");
          },
        ),
        SizedBox(
          height: 24,
        ),
        SingleChildScrollView(
          child: _currentValue == 1
              ? AddedPoints()
              : _currentValue == 2
                  ? RedeemedPoints()
                  : Container(),
        )
      ]),
    );
  }
}
