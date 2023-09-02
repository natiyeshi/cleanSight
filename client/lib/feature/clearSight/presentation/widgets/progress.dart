import "package:flutter/material.dart";
import "circle.dart";
import 'Line.dart';

class Progress extends StatelessWidget {
  Progress({super.key,this.index});
  int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Circle(flag: true),
          Line(flag: index! > 0),
          Circle(flag: index! > 0),
          Line(flag: index! > 1),
          Circle(flag: index! > 1),
          Line(flag: index! > 2),
          Circle(flag: index! > 2),
        ],
      ),
    );
  }
}
