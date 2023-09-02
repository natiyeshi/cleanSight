import 'package:client/feature/clearSight/presentation/blocs/bloc/photo_bloc.dart';
import 'package:client/feature/clearSight/presentation/widgets/custome_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "./Box.dart";

class Form2 extends StatefulWidget {
  Form2({super.key, this.nextPage, this.backPage});
  final void nextPage;
  final void backPage;
  @override
  State<Form2> createState() => _Form2State();
}

enum Choice { yes, no }

class _Form2State extends State<Form2> {
  Choice? selectedChoice, selectIssue;

  List<String> symptomes = [
    "swelling",
    "irritation" "eye redness",
    "itching",
    "Tick Discharge",
    "itching",
    "swelling",
    "irritation" "eye redness",
    "itching",
    "Tick Discharge",
    "swelling",
    "itching",
    "irritation" "eye redness",
    "itching",
    "Tick Discharge",
    "swelling",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 570,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Select your symptomes",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: symptomes.map((value) {
                        return Box(value: value);
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      "Do your family members or friends  experience trachoma ?",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio<Choice>(
                            value: Choice.yes,
                            groupValue: selectIssue,
                            onChanged: (value) {
                              setState(() {
                                selectIssue = value;
                              });
                            },
                          ),
                          Text('Yes'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<Choice>(
                            value: Choice.no,
                            groupValue: selectIssue,
                            onChanged: (value) {
                              setState(() {
                                selectIssue = value;
                              });
                            },
                          ),
                          Text('No'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        context.read<PhotoBloc>().add(Form1Event());
                      },
                      padding: EdgeInsets.symmetric(vertical: 14),
                      fillColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: () {
                        context.read<PhotoBloc>().add(Form3Event());
                      },
                      padding: EdgeInsets.symmetric(vertical: 14),
                      fillColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
