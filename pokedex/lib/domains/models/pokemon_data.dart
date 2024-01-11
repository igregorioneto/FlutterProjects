import 'package:pokedex/domains/models/pokemon.dart';
import 'package:pokedex/domains/models/pokemon_results_data.dart';

class PokemonData {
  int count;
  List<PokemonResultsData> results;

  PokemonData({required this.count, required this.results});

  factory PokemonData.fromJson(Map json) {
    final count = json['count'] as int;
    final results = json['results'] as List<dynamic>;
    final pokemons = results.map((e) => PokemonResultsData.fromJson(e)).toList();
    return PokemonData(count: count, results: pokemons);
  }
}