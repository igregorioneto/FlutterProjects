import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/domains/models/pokemon.dart';
import 'package:pokedex/domains/models/pokemon_data.dart';

class PokemonService {
  Future<List<Pokemon>> fetchPokemonsList() async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10&offset=0');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final results = PokemonData.fromJson(json).results;
        final List<Pokemon> listPokemons = [];
        for (var result in results) {
          final pokemonResponse = await http.get(Uri.parse(result.url));
          if (pokemonResponse.statusCode == 200) {
            final json = jsonDecode(pokemonResponse.body);
            final pokemon = Pokemon.fromJson(json);
            listPokemons.add(pokemon);
          } else {
            throw Exception(
                'Falha ao carregar lista de pokemons. Status Code: ${pokemonResponse.statusCode}');
          }
        }
        return listPokemons;
      } else {
        throw Exception(
            'Falha ao carregar lista de dados dos pokemons. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error durante a requisição: $e');
    }
  }
}
