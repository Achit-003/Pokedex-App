// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List pokedex = [];
  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      Positioned(
        top: -50,
        right: -50,
        child: Image.asset(
          "images/pokeball.png",
          width: 200,
          fit: BoxFit.fitWidth,
        ),
      ),
      const Positioned(
          top: 80,
          left: 20,
          child: Text(
            "Pokedex",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            ),
          )),
      Positioned(
        top: 150,
        bottom: 0,
        width: width,
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                ),
                itemCount: pokedex.length,
                itemBuilder: (context, index) {
                  var type = pokedex[index]['type'][0];

                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 9),
                      child: Container(
                        decoration: BoxDecoration(
                          color: type == 'Grass'
                              ? Colors.green
                              : type == 'Fire'
                                  ? Colors.redAccent
                                  : type == "Water"
                                      ? Colors.blueAccent
                                      : type == "Bug"
                                          ? Colors.greenAccent
                                          : type == "Normal"
                                              ? Colors.blueGrey
                                              : type == "Poison"
                                                  ? Colors.purpleAccent
                                                  : type == "Electric"
                                                      ? const Color.fromARGB(
                                                          218, 255, 233, 33)
                                                      : type == "Ground"
                                                          ? Colors.brown
                                                          : type == "Rock"
                                                              ? Colors.grey
                                                              : type ==
                                                                      "Psychic"
                                                                  ? Colors
                                                                      .indigoAccent
                                                                  : type ==
                                                                          "Fighting"
                                                                      ? Colors
                                                                          .orangeAccent
                                                                      : type ==
                                                                              "Ghost"
                                                                          ? Colors
                                                                              .deepPurpleAccent
                                                                          : type == "Ice"
                                                                              ? Colors.lightBlueAccent
                                                                              : Colors.pink,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Stack(children: [
                          Positioned(
                              bottom: -10,
                              right: -5,
                              child: Image.asset("images/pokeball.png",
                                  height: 90, fit: BoxFit.fitHeight)),
                          Positioned(
                            top: 20,
                            left: 15,
                            child: Text(
                              pokedex[index]["name"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            top: 45,
                            left: 20,
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              decoration: const BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0, top: 4, bottom: 4),
                                child: Text(
                                  type.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 0,
                            child: Hero(
                              tag: index,
                              child: CachedNetworkImage(
                                imageUrl: pokedex[index]['img'],
                                height: 95,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PokemonDetailScreen(
                                    pokemonDetail: pokedex[index],
                                    color: type == 'Grass'
                                        ? Colors.green
                                        : type == 'Fire'
                                            ? Colors.redAccent
                                            : type == "Water"
                                                ? Colors.blueAccent
                                                : type == "Bug"
                                                    ? Colors.greenAccent
                                                    : type == "Normal"
                                                        ? Colors.blueGrey
                                                        : type == "Poison"
                                                            ? Colors
                                                                .purpleAccent
                                                            : type == "Electric"
                                                                ? const Color
                                                                    .fromARGB(
                                                                    218,
                                                                    255,
                                                                    233,
                                                                    33)
                                                                : type ==
                                                                        "Ground"
                                                                    ? Colors
                                                                        .brown
                                                                    : type ==
                                                                            "Rock"
                                                                        ? Colors
                                                                            .grey
                                                                        : type ==
                                                                                "Psychic"
                                                                            ? Colors.indigoAccent
                                                                            : type == "Fighting"
                                                                                ? Colors.orangeAccent
                                                                                : type == "Ghost"
                                                                                    ? Colors.deepPurpleAccent
                                                                                    : type == "Ice"
                                                                                        ? Colors.lightBlueAccent
                                                                                        : Colors.pink,
                                    heroTag: index,
                                  )));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ]));
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        'Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];
        setState(() {});
      }
    });
  }
}
