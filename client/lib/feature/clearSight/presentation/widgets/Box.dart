import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  Box({super.key, this.value});
  String? value;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selected = !selected;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selected
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.background,
      ),
      child: Text(
        widget.value ?? "",
        style: TextStyle(
          color: selected
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
