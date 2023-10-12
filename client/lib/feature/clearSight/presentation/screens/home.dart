import 'package:client/feature/clearSight/presentation/blocs/bloc/photo_bloc.dart';
import 'package:client/feature/clearSight/presentation/widgets/result.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/progress.dart';
import '../widgets/Form1.dart';
import '../widgets/Form2.dart';
import '../widgets/Form3.dart';
import '../widgets/Form4.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> pages = [];
  Widget current = Form1();
  bool send = false;

  @override
  void initState() {
    pages = [
      Form1(),
      Form2(),
      Form3(),
      // Form4(message: "hiiii"),
      Result(),
    ];
    super.initState();
  }

  void uploadPhoto() {}

  void backPage() {
    print("back");
    if (index == 0) return;
    index--;
    setState(() {
      current = pages[index];
    });
  }

  void nextPage() {
    if (index == 3) return;
    index++;
    setState(() {
      current = pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          centerTitle: true,
          title: Container(
            padding: EdgeInsets.only(top: 20),
            child: const Text(
              'Clear Sight',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: BlocListener<PhotoBloc, PhotoState>(
        listener: (context, state) {
          setState(() {
            if (state is Form1State) {
              index = 0;
              current = pages[0];
            }
            if (state is Form2State) {
              index = 1;
              current = pages[1];
            }
            if (state is Form3State) {
              index = 2;
              current = pages[2];
            }
            if (state is Loading) {
              index = 3;
              current = pages[3];
            }
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Progress(index: index),
              current,
            ],
          ),
        ),
      ),
    );
  }
}
