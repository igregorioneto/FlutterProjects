class Pokemon {
  final int? id;
  final String? name;
  final String? sprite_official_artwork;

  final String types;
  final String types2;

  final int? weight;
  final int? height;
  final int? base_experience;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite_official_artwork,
    this.types = '',
    this.types2 = '',
    required this.height,
    required this.base_experience,
    required this.weight,
  });

  Pokemon.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        sprite_official_artwork =
            json['sprites']['other']['official-artwork']['front_default'],
        //pokemonListTypes = json['types'],
        weight = json['weight'],
        base_experience = json['base_experience'],
        height = json['height'],
        types = json['types'][0]['type']['name'],
        types2 = json['types'][1]['type']['name'];
}
