import 'package:flutter/cupertino.dart';

class LevelModel {
  Widget question;
  String questionResponse;
  List<num> answers;
  bool special;
  num response;

  LevelModel({
    required this.question,
    required this.questionResponse,
    required this.answers,
    required this.special,
    required this.response,
  });
}
