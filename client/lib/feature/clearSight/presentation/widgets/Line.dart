import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  Line({super.key, this.flag});

  bool? flag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 2.0,
      color: flag == false
          ? Colors.grey
          : Theme.of(context).colorScheme.primary, // Set the desired color
    );
  }
}
