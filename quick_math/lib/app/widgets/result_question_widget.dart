import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_math/app/constants.dart';
import 'package:quick_math/app/widgets/icon_text_widget.dart';

class ResultQuestionWidget extends StatelessWidget {
  String title;
  final VoidCallback onTap;
  final VoidCallback onTap2;
  int pontuationGame;
  int pontuationRankingGame;
  int coinGame;

  ResultQuestionWidget({
    super.key,
    required this.onTap,
    required this.onTap2,
    required this.title,
    required this.pontuationGame,
    required this.pontuationRankingGame,
    required this.coinGame,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        height: 300,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: whiteTextSmall,
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onTap,
                  icon: Icon(Icons.replay_circle_filled_rounded, size: 100),
                  color: Colors.lightBlueAccent,
                ),
                IconButton(
                  onPressed: onTap2,
                  icon: Icon(Icons.menu_outlined, size: 100),
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconTextWidget(
                    icon: Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 32,
                    ),
                    text: pontuationGame.toString()),
                IconTextWidget(
                    icon: FaIcon(
                      FontAwesomeIcons.trophy,
                      color: Colors.yellowAccent,
                      size: 24,
                    ),
                    text: pontuationRankingGame.toString()),
                IconTextWidget(
                    icon: Icon(
                      Icons.money_outlined,
                      color: Colors.green,
                      size: 32,
                    ),
                    text: coinGame.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
