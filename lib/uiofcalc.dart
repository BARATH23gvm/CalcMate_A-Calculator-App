import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

import 'buttons.dart';
import 'history.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '.',
    '0',
    'ANS',
    '=',
  ];
  List<List<String>> historyofentries = [];
  var userQuestion = '';
  var useranswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CALCULATOR",
          style: GoogleFonts.acme(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              HistoryList_usingBottombutton(context, historyofentries);
            },
            icon: Icon(Icons.swipe_up, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HistoryList(historyofentries),
                ),
              );
            },
            icon: Icon(Icons.history, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              color: Colors.blueGrey[400],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      userQuestion,
                      style: GoogleFonts.acme(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      useranswer,
                      style: GoogleFonts.acme(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.blueGrey[400],
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return MyButtonStyle(
                      Colors.teal,
                      buttons[index],
                      Colors.white,
                      () {
                        setState(() {
                          userQuestion = '';
                          useranswer = '';
                        });
                      },
                    );
                  } else if (index == 1) {
                    return MyButtonStyle(
                      Colors.red,
                      buttons[index],
                      Colors.white,
                      () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                            0,
                            userQuestion.length - 1,
                          );
                        });
                      },
                    );
                  } else if (index == buttons.length - 1) {
                    return MyButtonStyle(
                      Colors.deepPurple,
                      buttons[index],
                      Colors.white,
                      () {
                        setState(() {
                          evalute_userquestion();
                          addtolist();
                          userQuestion = useranswer ;
                        });
                      },
                    );
                  } else {
                    return NumOrNot(buttons[index])
                        ? MyButtonStyle(
                            Colors.blueGrey,
                            buttons[index],
                            Colors.white,
                            () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                          )
                        : MyButtonStyle(
                            Colors.blueGrey.shade200,
                            buttons[index],
                            Colors.black,
                            () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                          );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void evalute_userquestion() {
    String finalQues = userQuestion.replaceAll('x', '*');
    print(finalQues);

    ExpressionParser p = GrammarParser();
    Expression exp = p.parse(finalQues);

    var context = ContextModel()
      ..bindVariableName('x', Number(2.0))
      ..bindVariableName('y', Number(math.pi));

    var evaluator = RealEvaluator(context);
    num eval = evaluator.evaluate(exp);

    useranswer = eval.toString();
  }

  NumOrNot(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return false;
    }
    return true;
  }

  void addtolist() {
    List<String> entry = [userQuestion, useranswer];
    historyofentries.add(entry);
    print(historyofentries);
  }
}
