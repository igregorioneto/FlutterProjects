import 'package:flutter/material.dart';
import 'package:math_game/app/models/level_model.dart';

class GameProvider extends ChangeNotifier {

  List<LevelModel> _levelsPad = [
    LevelModel(numberA: 7, numberB: 3, operation: '+', nextLevel: false),
    LevelModel(numberA: 5, numberB: 2, operation: '-', nextLevel: false),
    LevelModel(numberA: 4, numberB: 6, operation: '*', nextLevel: false),
    LevelModel(numberA: 8, numberB: 2, operation: '/', nextLevel: false),
    LevelModel(numberA: 9, numberB: 4, operation: '+', nextLevel: false),
    LevelModel(numberA: 12, numberB: 4, operation: '/', nextLevel: false),
    LevelModel(numberA: 3, numberB: 2, operation: '*', nextLevel: false),
    LevelModel(numberA: 10, numberB: 5, operation: '-', nextLevel: false),
    LevelModel(numberA: 15, numberB: 3, operation: '*', nextLevel: false),
    LevelModel(numberA: 18, numberB: 6, operation: '/', nextLevel: false),
    LevelModel(numberA: 7, numberB: 4, operation: '+', nextLevel: false),
    LevelModel(numberA: 11, numberB: 2, operation: '-', nextLevel: false),
    LevelModel(numberA: 6, numberB: 2, operation: '*', nextLevel: false),
    LevelModel(numberA: 25, numberB: 5, operation: '/', nextLevel: false),
    LevelModel(numberA: 14, numberB: 7, operation: '*', nextLevel: false),
    LevelModel(numberA: 21, numberB: 3, operation: '-', nextLevel: false),
    LevelModel(numberA: 16, numberB: 4, operation: '+', nextLevel: false),
    LevelModel(numberA: 27, numberB: 9, operation: '/', nextLevel: false),
    LevelModel(numberA: 8, numberB: 4, operation: '*', nextLevel: false),
    LevelModel(numberA: 12, numberB: 3, operation: '-', nextLevel: false),
  ];

  List<LevelModel> get levelsPad => _levelsPad;

  int _level = 0;
  int get level => _level;

  void nextLevel() {
    if (_level >= 0 && _level < _levelsPad.length) {
      var element = _levelsPad[_level];

      if (!element.nextLevel) {
        _levelsPad[_level].nextLevel = true;
        _level++;
      }

    }
    notifyListeners();
  }

  LevelModel getLevel() {
    return _levelsPad[_level];
  }

}