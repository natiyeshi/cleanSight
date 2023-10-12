import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  Circle({super.key, this.flag});

  bool? flag;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: flag! ? 25.0 : 25,
      height: flag! ? 25.0 : 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: flag == false
            ? const Color.fromARGB(255, 196, 196, 196) // Set the desired color
            : Theme.of(context).primaryColor, // Set the desired color
      ),
      duration: Duration(seconds: 1),
      child: flag! ? Icon(Icons.check, size: 12, color: Colors.white) : null,
    );
  }
}
