import 'package:flutter/material.dart';
import 'package:flutter_application/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Application",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.purple),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    void equalPress() {
      String finalInput = userInput;
      finalInput = userInput.replaceAll('x', '*');
      Parser p = Parser();
      Expression expression = p.parse(finalInput);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      answer = eval.toString();
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Align(
                          alignment: Alignment.bottomRight,
                        ),
                        Text(userInput.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                        Text(answer.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                      ])),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            MyButton(
                              title: "AC",
                              onPress: () {
                                userInput = " ";
                                answer = " ";
                                setState(() {});
                              },
                            ),
                            MyButton(
                                title: "+/-",
                                onPress: () {
                                  userInput += "+/-";
                                  setState(() {});
                                }),
                            MyButton(
                                title: "%",
                                onPress: () {
                                  userInput += "%";
                                  setState(() {});
                                }),
                            MyButton(
                              title: "/",
                              onPress: () {
                                userInput += "/";
                                setState(() {});
                              },
                              color: const Color(0xffffa00a),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "7",
                          onPress: () {
                            userInput += "7";
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: "8",
                            onPress: () {
                              userInput += "8";
                              setState(() {});
                            }),
                        MyButton(
                            title: "9",
                            onPress: () {
                              userInput += "9";
                              setState(() {});
                            }),
                        MyButton(
                          title: "x",
                          onPress: () {
                            userInput += "x";
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: "4",
                            onPress: () {
                              userInput += "4";
                              setState(() {});
                            }),
                        MyButton(
                            title: "5",
                            onPress: () {
                              userInput += "5";
                              setState(() {});
                            }),
                        MyButton(
                          title: "6",
                          onPress: () {
                            userInput += "6";
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: "-",
                            onPress: () {
                              userInput += "-";
                              setState(() {});
                            },
                            color: const Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: "1",
                            onPress: () {
                              userInput += "1";
                              setState(() {});
                            }),
                        MyButton(
                            title: "2",
                            onPress: () {
                              userInput += "2";
                              setState(() {});
                            }),
                        MyButton(
                            title: "3",
                            onPress: () {
                              userInput += "3";
                              setState(() {});
                            }),
                        MyButton(
                            title: "+",
                            onPress: () {
                              userInput += "+";
                              setState(() {});
                            },
                            color: const Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: "0",
                            onPress: () {
                              userInput += "";
                              setState(() {});
                            }),
                        MyButton(
                            title: ".",
                            onPress: () {
                              userInput += ".";
                              setState(() {});
                            }),
                        MyButton(
                            title: "DEL",
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              answer = " ";
                              setState(() {});
                            }),
                        MyButton(
                            title: "=",
                            onPress: () {
                              equalPress();
                              setState(() {});
                            },
                            color: const Color(0xffffa00a)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
