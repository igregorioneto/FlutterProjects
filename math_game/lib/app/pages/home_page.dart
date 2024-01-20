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
          ),

          // Calculate
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    numberA.toString() + ' + ' + numberB.toString() + ' = ',
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
