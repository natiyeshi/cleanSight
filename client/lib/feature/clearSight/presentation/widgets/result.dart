import 'package:client/feature/clearSight/presentation/blocs/bloc/photo_bloc.dart';
import 'package:client/feature/clearSight/presentation/screens/home.dart';
import 'package:client/feature/clearSight/presentation/screens/seeai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loading.dart' as LoadingWidget;

class Result extends StatefulWidget {
  Result({super.key});
  @override
  State<Result> createState() => _ResultState();
}

enum Gender { male, female }

class _ResultState extends State<Result> {
  Gender? selectedGender, selectIssue;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        return Column(
          children: [
            state is Loading
                ? Container(
                    height: 300,
                    child: Center(child: LoadingWidget.Loading(color: false)),
                  )
                : Container(
                    // height: 570,
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        if (state is Form4State)
                          _result(state.result['predicted_class'] != 0, state),
                        if (state is Error)
                          Container(
                            height: 160,
                            child: Center(child: Text("something goes wrong")),
                          ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer),
                              ),
                              child: Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Home()));
                                  },
                                  child: Text(
                                    "retake",
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 134, 134, 134)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SeeAi()));
                                },
                                child: Row(children: [
                                  Image.asset(
                                    "assets/images/icon.png",
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(width: 9),
                                  Text(
                                    "Any Question ?",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ]),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Related Qestions",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 15),
                        faq(context, "what is trachoma ?"),
                        SizedBox(height: 15),
                        faq(context, "where does trachoma comes from ?"),
                        SizedBox(height: 15),
                        faq(context, "is trachoma treatable ?"),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Attention",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              SizedBox(height: 10),
                              Text(
                                  "This result is not perfect. our ai is learning through different data. so please take this result wisely as an indication. "),
                            ],
                          ),
                        ),
                        SizedBox(height: 55),
                      ],
                    ),
                  ),
          ],
        );
      },
    );
  }

  Widget _result(bool negative, dynamic state) {
    double percent = state.result["class_probabilities"]
            [state.result["predicted_class"]] *
        100;

    return Container(
      height: 160,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: negative
            ? Theme.of(context).colorScheme.primary
            : Color(0xFFFFC4C0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            negative ? "Negative" : "Posetive",
            style: TextStyle(
              color: negative ? Colors.white : Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "you have $percent chance",
            style: TextStyle(
              color: negative ? Colors.white : Colors.black,
              // fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget faq(context, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SeeAi(),
            settings: RouteSettings(
              arguments: [text],
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondaryContainer,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            const Expanded(flex: 1, child: Icon(Icons.question_mark)),
            const SizedBox(width: 10),
            Expanded(flex: 12, child: Text(text)),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Transform.rotate(
                angle: -3.6,
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
