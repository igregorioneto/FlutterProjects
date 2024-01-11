import 'dart:ui';

import 'package:flutter/material.dart';

class PokemonTypeColors {

  static Color getColorTypePokemon(String type) {
    switch(type) {
      case 'normal':
        return Colors.white;
      case 'fighting':
        return Colors.red;
      case 'flying':
        return Colors.blue;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.orange;
      case 'rock':
        return Colors.grey;
      case 'bug':
        return Colors.green;
      case 'ghost':
        return Colors.indigo;
      case 'steel':
        return Colors.blueGrey;
      case 'fire':
        return Colors.deepOrange;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.yellow;
      case 'psychic':
        return Colors.pink;
      case 'ice':
        return Colors.lightBlue;
      case 'dragon':
        return Colors.indigo;
      case 'dark':
        return Colors.brown;
      case 'fairy':
        return Colors.pinkAccent;
      case 'unknown':
        return Colors.grey;
      case 'shadow':
        return Colors.black;
      default:
        return Colors.grey;
    }
  }

}