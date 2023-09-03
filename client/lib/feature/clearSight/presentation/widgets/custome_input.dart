import 'package:flutter/material.dart';

class CustomeInput extends StatefulWidget {
  const CustomeInput({super.key});

  @override
  State<CustomeInput> createState() => _CustomeInputState();
}

class _CustomeInputState extends State<CustomeInput> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      onChanged: null,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Insert Your Age",
          border: OutlineInputBorder(),
          labelStyle: TextStyle(
            fontSize: 15,
          )),
    );
  }
}
