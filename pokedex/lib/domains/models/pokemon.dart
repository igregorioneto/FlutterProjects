class Pokemon {
  final int? id;
  final String name;
  final String sprite_official_artwork;
  // final type_1;
  // final type_2;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite_official_artwork,
    // required this.type_1,
    // required this.type_2,
  });

  Pokemon.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        sprite_official_artwork =
           json['sprites']['other']['official-artwork']['front_default'];
        //type_1 = json['types'][0]['type']['name'].toString() ?? '',
        //type_2 = json['types'][1]['type']['name'].toString() ?? '';
}
