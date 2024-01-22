import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:function_tree/function_tree.dart';
import 'package:provider/provider.dart';
import 'package:quick_math/app/constants.dart';
import 'package:quick_math/app/providers/game_provider.dart';
import 'package:quick_math/app/widgets/buttom_widget.dart';
import 'package:quick_math/app/widgets/icon_text_widget.dart';
import 'package:quick_math/app/widgets/result_question_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Game Provider
  late GameProvider game;

  // Timer Reference
  late Timer _timerReference;

  // Time and Score
  double _timer = 10;
  int _score = 0;

  // Slider Time
  double _timeCurrent = 0;
  double _maxTimeValue = 10;
  int _steps = 100;
  Duration _duration = Duration(seconds: 10);

  // Grid Board
  var responseBoard = [
    '7',
    '-1',
    '-2',
    '5',
  ];

  @override
  void initState() {
    super.initState();
    startLoading();
    game = Provider.of<GameProvider>(context, listen: false);
    game.generatedLevel();
  }

  void startLoading() {
    _timerReference = Timer.periodic(_duration ~/ _steps, (timer) {
      setState(() {
        _timeCurrent += _maxTimeValue / _steps;
        _timer -= _maxTimeValue / _steps;
        if (_timeCurrent >= _maxTimeValue && _timer < 0) {
          _timeCurrent = 0;
          _timer = 10;
        }
      });
    });
  }

  void verifyQuestion(int value) {
    final level = game.getLevel();
    final question = level.question.replaceAll('?', value.toString());
    List<String> parts = question.split('=');

    final q = parts[0].trim();
    final res = int.parse(parts[1].trim());

    if (q.interpret() == res) {
      game.nextLevel();
      generateScore();
      /*if (game.gameWin()) {
        showDialog(
          context: context,
          builder: (context) {
            return ResultQuestionWidget(
              onTap: reloadQuickQuestion,
              title: 'Finish Game - You Win',
              pontuationGame: 0,
              pontuationRankingGame: 7,
            );
          },
        );
      }*/
    } else {
      game.finish();

      if (_timerReference.isActive) {
        _timerReference.cancel();
      }

      showDialog(
        context: context,
        builder: (context) {
          return ResultQuestionWidget(
            onTap: reloadQuickQuestion,
            title: 'You Lost - Play Again',
            pontuationGame: _score,
            pontuationRankingGame: 7,
          );
        },
      );
    }
  }

  void generateScore() {
    _score++;
  }

  void reloadQuickQuestion() {
    Navigator.of(context).pop();
    game.reloadingGame();
    // Time and Score
    _timer = 10;
    _score = 0;

    // Slider Time
    _timeCurrent = 0;
    _maxTimeValue = 10;

    // Starting
    startLoading();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final level = Provider.of<GameProvider>(context).getLevel();

    int _timerAsInt = _timer.toInt();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF39555FFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconTextWidget(icon: Icons.access_time, text: '$_timerAsInt'),
                  IconTextWidget(icon: Icons.star, text: '$_score'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 40,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                      trackShape: RectangularSliderTrackShape(),
                      inactiveTrackColor: Colors.blueGrey,
                    ),
                    child: Expanded(
                      child: Slider(
                        value: _timeCurrent,
                        min: 0,
                        max: _maxTimeValue,
                        onChanged: (value) {},
                        activeColor: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ],
              ),

              // Board question
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      level.question,
                      style: whiteText,
                    ),
                  ],
                ),
              ),

              // Board answers
              !game.gameFinish ? Expanded(
                child: GridView.builder(
                  itemCount: level.answers.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (context, index) {
                    return MyButton(
                      value: !game.gameFinish ? level.answers[index] : 0,
                      onTap: verifyQuestion,
                    );
                  },
                ),
              ) : Container(),

              SizedBox(height: 20),
              !game.gameFinish ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.lightbulb,
                      size: 40,
                    ),
                    color: Colors.yellowAccent,
                    onPressed: () {},
                  )
                ],
              ) : Container(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
