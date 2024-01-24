import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:function_tree/function_tree.dart';
import 'package:provider/provider.dart';
import 'package:quick_math/app/constants.dart';
import 'package:quick_math/app/enums/shape_type.dart';
import 'package:quick_math/app/providers/game_provider.dart';
import 'package:quick_math/app/util/shape_converter.dart';
import 'package:quick_math/app/widgets/animated_money_widget.dart';
import 'package:quick_math/app/widgets/buttom_widget.dart';
import 'package:quick_math/app/widgets/geometric_shape_widget.dart';
import 'package:quick_math/app/widgets/icon_text_widget.dart';
import 'package:quick_math/app/widgets/result_question_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // Game Provider
  late GameProvider game;

  // Timer Reference
  late Timer _timerReference;

  // Time and Score
  double _timer = 10;

  // Slider Time
  double _timeCurrent = 0;
  double _maxTimeValue = 10;
  int _steps = 100;
  Duration _duration = Duration(seconds: 10);

  // Init State Game Page
  @override
  void initState() {
    super.initState();
    startLoading();
    resetGame();
    game = Provider.of<GameProvider>(context, listen: false);
    game.generatedLevel();
  }

  // Reset Game
  void resetGame() {
    game = Provider.of<GameProvider>(context, listen: false);
    game.generatedLevel();
    setState(() {
      reloadTimer();
      game.resetScore();
      game.start();
    });
  }

  // Start Game
  void startLoading() {
    _timerReference = Timer.periodic(_duration ~/ _steps, (timer) {
      setState(() {
        _timeCurrent += _maxTimeValue / _steps;
        _timer -= _maxTimeValue / _steps;
        if (_timeCurrent >= _maxTimeValue && _timer < 0) {
          endGame();
          reloadTimer();
        }
      });
    });
  }

  // Verify Question
  void verifyQuestion(num value) {
    final level = game.getLevel();
    /*final question = level.questionResponse.replaceAll('?', value.toString());
    List<String> parts = question.split('=');

    final q = parts[0].trim();
    final res = num.parse(parts[1].trim());*/

    if (value == level.response) {
      _timerReference.cancel();
      showMoneyAnimation(context, '2', Icons.add);
      game.nextLevel();
      generateScore();
      if (game.getLevel().special) {
        _duration = Duration(seconds: 30);
        _timer = 30;
      } else {
        _duration = Duration(seconds: 10);
        _timer = 10;
      }
    } else {
      endGame();
    }
  }

  // End Game
  void endGame() {
    game.finish();

    if (_timerReference.isActive) {
      _timerReference.cancel();
    }

    game.updatingValues();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ResultQuestionWidget(
          onTap: reloadQuickQuestion,
          onTap2: () => returnMenu(context),
          title: 'You Lost - Play Again',
          pontuationGame: game.scoreBase,
          pontuationRankingGame: game.rankedScore,
          coinGame: game.coinBase,
        );
      },
    );
  }

  // Money Animation
  void showMoneyAnimation(BuildContext context, String value, final icon) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: AnimatedMoneyWidget(
            value: value,
            icon: icon,
          ),
        );
      },
    );

    reloadTimer();
    if (_timerReference.isActive) {
      _timerReference.cancel();
    }
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
      startLoading();
    });
  }

  // Return Menu Game
  void returnMenu(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).popUntil(ModalRoute.withName("/"));
  }

  // Generate Score Pontuation
  void generateScore() {
    game.updatingScore();
    game.updatingCoinBase(game.score);
    if (game.score >= game.rankedScore) {
      game.updatingRankedScore(game.score);
    }
  }

  // Reloading Game
  void reloadQuickQuestion() {
    Navigator.of(context).pop();
    game.reloadingGame();
    // Time and Score
    game.resetScore();

    // Starting
    startLoading();
  }

  // Reloading Timer Gamer
  void reloadTimer() {
    if (game.getLevel().special) {
      _timeCurrent = 0;
      _timer = 30;
      _maxTimeValue = 30;
    } else {
      _timeCurrent = 0;
      _timer = 10;
      _maxTimeValue = 10;
    }
  }

  // Using Tip Question
  void usingTip() {
    if (game.coinBase > 5) {
      game.usingCoinBase();
      showMoneyAnimation(context, '5', Icons.minimize_outlined);
      game.nextLevel();
    }
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
                  IconTextWidget(
                      icon: Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 32,
                      ),
                      text: '$_timerAsInt'),
                  Row(
                    children: [
                      IconTextWidget(
                          icon: Icon(
                            Icons.star,
                            color: Colors.yellowAccent,
                            size: 32,
                          ),
                          text: '${game.score}'),
                      SizedBox(width: 10),
                      IconTextWidget(
                          icon: Icon(
                            Icons.money_outlined,
                            color: Colors.green,
                            size: 32,
                          ),
                          text: '${game.coinBase}'),
                    ],
                  ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*Text(
                      !level.special
                          ? level.question
                          : ShapeConverter.replaceShapesInQuestion(
                              level.question),
                      style: whiteText,
                    ),*/
                    level.question,
                  ],
                ),
              ),

              // Board answers
              !game.gameFinish
                  ? Expanded(
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
                    )
                  : Container(),

              SizedBox(height: 20),
              !game.gameFinish
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.lightbulb,
                            size: 40,
                          ),
                          color: Colors.yellowAccent,
                          onPressed: usingTip,
                        )
                      ],
                    )
                  : Container(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
