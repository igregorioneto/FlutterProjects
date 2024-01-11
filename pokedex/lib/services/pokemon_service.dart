import 'dart:convert';
import 'package:pokedex/domains/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/domains/models/pokemon_data.dart';
import 'package:pokedex/domains/models/pokemon_results_data.dart';

class PokemonService {
  final String _urlDefault =
      'https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0';

  Future<List<PokemonResultsData>> fetchPokemonsList() async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return PokemonData.fromJson(json).results;
      } else {
        throw Exception(
            'Falha ao carregar lista de pokemons. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error durante a requisição: $e');
    }
  }
}
