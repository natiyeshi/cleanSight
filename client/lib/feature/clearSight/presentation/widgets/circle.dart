import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  Circle({super.key, this.flag});

  bool? flag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13.0,
      height: 13.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: flag == false
            ? Colors.grey
            : Theme.of(context).primaryColor, // Set the desired color
      ),
    );
  }
}
