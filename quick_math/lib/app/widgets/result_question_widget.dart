import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_math/app/constants.dart';
import 'package:quick_math/app/widgets/icon_text_widget.dart';

class ResultQuestionWidget extends StatelessWidget {
  String title;
  final VoidCallback onTap;
  int pontuationGame;
  int pontuationRankingGame;

  ResultQuestionWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.pontuationGame,
    required this.pontuationRankingGame,
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onTap,
                  icon: Icon(Icons.replay_circle_filled_rounded, size: 150),
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconTextWidget(
                    icon: Icon(
                      Icons.star,
                      color: Colors.lightBlueAccent,
                      size: 32,
                    ),
                    text: pontuationGame.toString()),
                IconTextWidget(
                    icon: FaIcon(
                      FontAwesomeIcons.trophy,
                      color: Colors.lightBlueAccent,
                      size: 24,
                    ),
                    text: pontuationRankingGame.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
