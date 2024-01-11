class PokemonResultsData {
  final String name;
  final String url;

  PokemonResultsData({required this.name, required this.url});

  PokemonResultsData.fromJson(Map json)
      : name = json['name'],
        url = json['url'];
}
