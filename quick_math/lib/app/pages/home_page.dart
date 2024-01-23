import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quick_math/app/constants.dart';
import 'package:quick_math/app/pages/game_page.dart';
import 'package:quick_math/app/providers/game_provider.dart';
import 'package:quick_math/app/widgets/icon_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GameProvider game;

  @override
  void initState() {
    super.initState();
    game = Provider.of<GameProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF39555FFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GamePage(),
                    ),
                  );
                },
                icon: Icon(Icons.play_circle, size: 150),
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
          SizedBox(height: 20),
          Consumer<GameProvider>(
            builder: (context, game, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconTextWidget(
                      icon: Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 32,
                      ),
                      text: game.scoreBase.toString()),
                  IconTextWidget(
                      icon: FaIcon(
                        FontAwesomeIcons.trophy,
                        color: Colors.yellowAccent,
                        size: 24,
                      ),
                      text: game.rankedScore.toString()),
                  IconTextWidget(
                      icon: Icon(
                        Icons.money_outlined,
                        color: Colors.green,
                        size: 32,
                      ),
                      text: game.coinBase.toString()),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
