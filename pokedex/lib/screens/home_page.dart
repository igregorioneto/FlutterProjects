import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domains/models/pokemon.dart';
import 'package:pokedex/domains/models/pokemon_results_data.dart';
import 'package:pokedex/services/pokemon_service.dart';
import 'package:pokedex/util/pokemon_type_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPokemon = 0;
  final _controllerCarousel = CarouselController();
  final _pokemonService = PokemonService();

  String? imagePokemon = "";

  Future<List<Pokemon>>? listPokemons;

  @override
  void initState() {
    listPokemons = _pokemonService.fetchPokemonsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(
              imagePokemon! ?? '',
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade50.withOpacity(1),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: listPokemons,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 500,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.7,
                        onPageChanged: (index, reason) {
                          setState(() {
                            imagePokemon =
                                snapshot.data![index].sprite_official_artwork;
                          });
                        },
                      ),
                      carouselController: _controllerCarousel,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index, realIndex) {
                        var pokemon = snapshot.data![index];
                        return Builder(
                          builder: (context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: PokemonTypeColors.getColorTypePokemon('fire').withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 320,
                                      margin: EdgeInsets.only(top: 30),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.network(
                                        pokemon.sprite_official_artwork,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      pokemon.name.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text(
                                            'fire'.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          padding: EdgeInsets.all(10),
                                          color: PokemonTypeColors
                                              .getColorTypePokemon('fire'),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          child: Text(
                                            'rock'.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          padding: EdgeInsets.all(10),
                                          color: PokemonTypeColors.getColorTypePokemon('rock'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
