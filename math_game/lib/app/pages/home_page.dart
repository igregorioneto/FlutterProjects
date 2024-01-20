import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game/app/util/constants.dart';
import 'package:math_game/app/widgets/my_button.dart';
import 'package:math_game/app/widgets/result_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var randomNumber = Random();
  String userResponse = '';

  int numberA = 0;
  int numberB = 0;
  String operation = '-';

  @override
  void initState() {
    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  final numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    'x',
    '=',
  ];

  final levelsPad = [
    [7, 3, '+', true],
    [5, 2, '-', false],
    [4, 6, '*', false],
    [8, 2, '/', false],
    [9, 4, '+', false],
    [12, 4, '/', false],
    [3, 2, '*', false],
    [10, 5, '-', false],
    [15, 3, '*', false],
    [18, 6, '/', false],
    [7, 4, '+', false],
    [11, 2, '-', false],
    [6, 2, '*', false],
    [25, 5, '/', false],
    [14, 7, '*', false],
    [21, 3, '-', false],
    [16, 4, '+', false],
    [27, 9, '/', false],
    [8, 4, '*', false],
    [12, 3, '-', false],
  ];

  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
      } else if (button == 'C') {
        userResponse = '';
      } else if (button == 'DEL') {
        if (userResponse.isNotEmpty) {
          userResponse = userResponse.substring(0, userResponse.length - 1);
        }
      } else if (userResponse.length < 3) {
        userResponse += button;
      }
    });
  }

  void checkResult() {
    if (numberA + numberB == int.parse(userResponse)) {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Correct!',
            onTap: goToNextQuestion,
            icon: Icons.arrow_forward,
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Sorry try again',
            onTap: goBackToQuestion,
            icon: Icons.rotate_left,
          );
        },
      );
    }
  }

  void goToNextQuestion() {
    Navigator.of(context).pop();

    setState(() {
      userResponse = '';
    });

    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  void goBackToQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      body: Column(
        children: [
          // Levels
          Container(
            height: 160,
            color: Colors.blueGrey[200],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: levelsPad.length,
              itemBuilder: (context, index) {
                final bool isCorrect = levelsPad[index].elementAt(3) as bool;

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: !isCorrect ? Colors.blueGrey : Colors.blueGrey[300],
                        borderRadius: BorderRadius.circular(8),
                        border: isCorrect ? Border.all(color: Colors.red) : Border(),
                        boxShadow: [
                          if (!isCorrect)
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Calculate
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    numberA.toString() +
                        ' ' +
                        operation.toString() +
                        ' ' +
                        numberB.toString() +
                        ' = ',
                    style: whiteTextStyle,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[500],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        userResponse,
                        style: whiteTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Board
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
