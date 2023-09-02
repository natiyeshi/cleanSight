import 'package:client/feature/clearSight/presentation/blocs/bloc/photo_bloc.dart';
import 'package:client/feature/clearSight/presentation/widgets/custome_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Form1 extends StatefulWidget {
  Form1({super.key, this.nextPage, this.backPage});
  final void nextPage;
  final void backPage;
  @override
  State<Form1> createState() => _Form1State();
}

enum Gender { male, female }

class _Form1State extends State<Form1> {
  Gender? selectedGender, selectIssue;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 570,
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Your Age",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 10),
                  CustomeInput(),
                  SizedBox(height: 30),
                  Text(
                    "Do You Have Past Eye Issues ?",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio<Gender>(
                            value: Gender.male,
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
                          Radio<Gender>(
                            value: Gender.female,
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
                  SizedBox(height: 20),
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 97, 95, 95),
                        width: 2.0,
                      ),
                    ),
                    child: const RawMaterialButton(
                      onPressed: null,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 23.0,
                            color: Color.fromARGB(255, 134, 134, 134),
                          ),
                          // SizedBox(width: 4),
                          Text(
                            "Pick",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 97, 95, 95),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Gender",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio<Gender>(
                            value: Gender.male,
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          Text('Yes'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<Gender>(
                            value: Gender.female,
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
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
                        context.read<PhotoBloc>().add(Form2Event());
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
