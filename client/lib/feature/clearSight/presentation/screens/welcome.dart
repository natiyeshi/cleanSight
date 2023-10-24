import 'package:client/feature/clearSight/presentation/screens/home.dart';
import 'package:client/feature/clearSight/presentation/screens/seeai.dart';
import 'package:client/feature/clearSight/presentation/widgets/Box.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clear Sight",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeeAi(),
                  ));
            },
            child: Container(
              height: 45,
              width: 45,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                "assets/images/icon.png",
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pageShow(context),
              const SizedBox(height: 5),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Bullet(false, context),
              //     const SizedBox(width: 10),
              //     Bullet(true, context),
              //     const SizedBox(width: 10),
              //     Bullet(false, context),
              //   ],
              // ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(14.0)),
                    child: const Text(
                      "Check Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Related Topics",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              faq(context, "What are the common symptoms of trachoma?"),
              const SizedBox(
                height: 10,
              ),
              faq(context, "Can trachoma be treated or cured?"),
              const SizedBox(
                height: 10,
              ),
              faq(context, "How can trachoma be prevented?"),
              const SizedBox(
                height: 45,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Consultation ",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 5,
                          child: Text(
                              "You can consult your problem to our chat bot"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SeeAi(),
                                ),
                              );
                            },
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            textColor: Theme.of(context).colorScheme.primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 6, right: 6, top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("SEEAI"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    "assets/images/icon2.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageShow(context) {
    return Container(
      width: 370,
      height: 170,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20, right: 7, left: 7),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                CheckPoint("Fast trachoma detection"),
                SizedBox(height: 4),
                CheckPoint("Bot, that you can consult"),
                SizedBox(height: 4),
                CheckPoint("Helpfull QAs"),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Image.asset(
              "assets/images/Image (1).png",
            ),
          ),
        ],
      ),
    );
  }

  Widget CheckPoint(String text) {
    return Row(
      children: [
        Icon(Icons.check),
        SizedBox(width: 10),
        Text(
          text,
        ),
      ],
    );
  }

  Widget Bullet(bool active, context) {
    return Container(
      height: 11,
      width: 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondaryContainer,
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
