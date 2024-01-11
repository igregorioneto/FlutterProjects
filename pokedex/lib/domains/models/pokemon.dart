class Pokemon {
  final int? id;
  final String name;
  //final String sprite_official_artwork;

  Pokemon({
    required this.id,
    required this.name,
    //required this.sprite_official_artwork,
  });

  Pokemon.fromJson(Map json)
      : id = json['id'],
        name = json['name'];
        //sprite_official_artwork =
        //    json['sprites']['other']['official-artwork']['front_default'];
}
