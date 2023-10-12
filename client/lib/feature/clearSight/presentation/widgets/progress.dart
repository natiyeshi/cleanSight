import "package:flutter/material.dart";
import "circle.dart";
import 'Line.dart';

class Progress extends StatelessWidget {
  Progress({super.key, this.index});
  int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.secondaryContainer,
          color: Color.fromARGB(255, 236, 236, 236),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
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
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 13),
                Text("user data"),
                SizedBox(width: 33),
                Text("symptomes"),
                SizedBox(width: 35),
                Text("image"),
                SizedBox(width: 53),
                Text("result"),
              ],
            ),
          ],
        ));
  }
}
