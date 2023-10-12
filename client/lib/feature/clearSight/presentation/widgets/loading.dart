import 'dart:async';

import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  Loading({super.key, required this.color});
  final bool color;
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int currentIndex = 0;
  List<Color> colors = [
    Color.fromARGB(255, 173, 173, 173),
    Color.fromARGB(255, 134, 133, 133),
    Color.fromARGB(255, 104, 103, 103),
    Color.fromARGB(255, 63, 63, 63),
  ];

  
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % colors.length;
      });
    });
  }
  
  @override
  void dispose() {
    timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        color: widget.color
            ? Theme.of(context).colorScheme.secondaryContainer
            : Colors.transparent,
        borderRadius: BorderRadius.circular(3),
      ),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Row(
          children: [
            Container(
              width: 5,
              margin: EdgeInsets.only(right: 5),
              height: 5,
              decoration: BoxDecoration(
                  color: colors[(currentIndex + 3) % 4],
                  borderRadius: BorderRadius.circular(50)),
            ),
            Container(
              width: 5,
              margin: EdgeInsets.only(right: 5),
              height: 5,
              decoration: BoxDecoration(
                  color: colors[(currentIndex + 2) % 4],
                  borderRadius: BorderRadius.circular(50)),
            ),
            Container(
              width: 5,
              margin: EdgeInsets.only(right: 5),
              height: 5,
              decoration: BoxDecoration(
                  color: colors[(currentIndex + 1) % 4],
                  borderRadius: BorderRadius.circular(50)),
            ),
            Container(
              width: 5,
              margin: EdgeInsets.only(right: 5),
              height: 5,
              decoration: BoxDecoration(
                  color: colors[(currentIndex) % 4],
                  borderRadius: BorderRadius.circular(50)),
            ),
          ],
        ),
      ),
    );
  }
}
