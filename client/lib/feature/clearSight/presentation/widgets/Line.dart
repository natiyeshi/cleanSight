import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  Line({super.key, this.flag});

  bool? flag;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 70.0,
      height: 2.0,
      color: flag == false
          ? const Color.fromARGB(255, 196, 196, 196)
          : Theme.of(context).colorScheme.primary,
      duration: Duration(seconds: 1),
      // Set the desired color
    );
  }
}
