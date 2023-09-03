import 'package:client/feature/clearSight/presentation/blocs/bloc/photo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Form4 extends StatefulWidget {
  Form4({super.key, this.nextPage, this.backPage, this.message});
  final void nextPage;
  final void backPage;
  final String? message;
  @override
  State<Form4> createState() => _Form4State();
}

enum Gender { male, female }

class _Form4State extends State<Form4> {
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
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    "Result",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    height: 300,
                    child: state is Form4State
                        ? Text(
                            "you have " +
                                (state.result["class_probabilities"]
                                            [state.result["predicted_class"]] *
                                        100)
                                    .toString()
                                    .substring(0, 6) +
                                "% of chance to be ${state.result['predicted_class'] == 0 ? 'affected' : 'healthy'} ",
                            style: TextStyle(fontSize: 18))
                        : state is Loading
                            ? Center(child: CircularProgressIndicator())
                            : Text("something goes wrong!!",
                                style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 10),
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
                        context.read<PhotoBloc>().add(Form3Event());
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
                        context.read<PhotoBloc>().add(Form1Event());
                      },
                      padding: EdgeInsets.symmetric(vertical: 14),
                      fillColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Finalize",
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
