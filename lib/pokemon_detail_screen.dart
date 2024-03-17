// ignore_for_file: prefer_typing_uninitialized_variables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;
  

  const PokemonDetailScreen({super.key, this.pokemonDetail, required this.color, required this.heroTag});

  @override
  State<PokemonDetailScreen> createState() => PokemonDetailScreenState();
}

class PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top : 30,
            left : 20,
            child: IconButton(icon: const Icon(Icons.arrow_back_rounded , color: Colors.white, size : 30),  onPressed: (){
              Navigator.pop(context);
            }),
          ),
          // tilte name
          Positioned(
            top : 80,
            left: 20,
            child: Text(
              widget.pokemonDetail['name'],
              style: const TextStyle(
              fontSize : 35,
              fontWeight : FontWeight.bold,
              color : Colors.white 
              ),
            ),
          ),


          // Pokemon type box
          Positioned(
            top : 130,
            left : 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: const LinearGradient(colors: [Colors.white54 , Colors.white70], begin: Alignment.bottomLeft , end: Alignment.topRight),
                boxShadow:[ BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 2, blurRadius: 7 , offset : const Offset(1, 2))],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left : 8.0 , right: 8.0 , top: 4.0 , bottom: 4.0),
                child: Text(
                  widget.pokemonDetail['type'].join(', '),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          
          // Pokemon image on right
          Positioned(
            top: height * 0.19,
            right: -38,
            child: Image.asset('images/pokeball.png', height: 200, fit: BoxFit.fitWidth)),


          // Container having pokemon information
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.6,
              decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(30) , topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width*0.3,
                            child: const Text("Name", style: TextStyle(
                              color: Colors.blueGrey , 
                              fontSize: 18,
                            ),
                            ),
                            ),
                          
                          Container(
                            width: width*0.3,
                            child : Text(widget.pokemonDetail['name'], style: const TextStyle(
                              color: Colors.black , 
                              fontSize: 18,
                              fontWeight: FontWeight.bold,),
                          ),
                          )
                        ],
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width*0.3,
                            child: const Text("Height", style: TextStyle(
                              color: Colors.blueGrey , 
                              fontSize: 18,
                            ),
                            ),
                            ),
                          
                          Container(
                            child : Text(widget.pokemonDetail['height'], style: const TextStyle(
                              color: Colors.black , 
                              fontSize: 18,
                              fontWeight: FontWeight.bold,),
                          ),
                          )
                        ],
                      ),
                    ),

                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width*0.3,
                            child: const Text("Weight", style: TextStyle(
                              color: Colors.blueGrey , 
                              fontSize: 18,
                            ),
                            ),
                            ),
                          
                          Container(
                            child : Text(widget.pokemonDetail['weight'], style: const TextStyle(
                              color: Colors.black , 
                              fontSize: 18,
                              fontWeight: FontWeight.bold,),
                          ),
                          )
                        ],
                      ),
                    ),

                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                          width: width*0.3,
                            child: const Text("Spawn Time", style: TextStyle(
                              color: Colors.blueGrey , 
                              fontSize: 18,
                            ),
                            ),
                            ),
                          
                          Container(
                            child : Text(widget.pokemonDetail['spawn_time'], style: const TextStyle(
                              color: Colors.black , 
                              fontSize: 18,
                              fontWeight: FontWeight.bold,),
                          ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top :8.0 , left : 8.0 , bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width*0.3,
                            child: const Text("Weakness", style: TextStyle(
                              color: Colors.blueGrey , 
                              fontSize: 18,
                            ),
                            ),
                            ),
                          
                          Container(
                            child : Text(widget.pokemonDetail['weaknesses'].join(", "), style: const TextStyle(
                              color: Colors.black , 
                              fontSize: 18,
                              fontWeight: FontWeight.bold,),
                          ),
                          )
                        ],
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.only(top :8.0 , left : 8.0 , bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width*0.3,
                            child: const Text("Evolution", style: TextStyle(
                              color: Colors.blueGrey , 
                              fontSize: 18,
                            ),
                            ),
                            ),
                            widget.pokemonDetail['next_evolution'] != null ?
                            SizedBox(
                              height: 25,
                              width: width* 0.55,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.pokemonDetail['next_evolution'].length,
                                itemBuilder: (context , index){
                                  return Padding(
                                    padding: const EdgeInsets.only(right : 8.0),
                                    child: Text(widget.pokemonDetail['next_evolution'][index]['name'],
                                    style: const TextStyle(
                                      color : Colors.black,
                                      fontSize : 18,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  );
                                },
                              ),
                            ) : const Text("Maxed Out" , style: TextStyle(
                                      color : Colors.black,
                                      fontSize : 18,
                                      fontWeight: FontWeight.bold,
                                    ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top :8.0 , left : 8.0 , bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width*0.3,
                            child: const Text("Pre Form", style: TextStyle(
                              color: Colors.blueGrey , 
                              fontSize: 18,
                            ),
                            ),
                            ),
                            widget.pokemonDetail['prev_evolution'] != null ?
                            SizedBox(
                              height: 25,
                              width: width* 0.55,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.pokemonDetail['prev_evolution'].length,
                                itemBuilder: (context , index){
                                  return Padding(
                                    padding: const EdgeInsets.only(right : 8.0),
                                    child: Text(widget.pokemonDetail['prev_evolution'][index]['name'],
                                    style: const TextStyle(
                                      color : Colors.black,
                                      fontSize : 18,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  );
                                },
                              ),
                            ) : const Text("Base Form" , style: TextStyle(
                                      color : Colors.black,
                                      fontSize : 18,
                                      fontWeight: FontWeight.bold,
                                    ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
           
          // Pokemon Image 
          Positioned(
            top : (height*0.19),
            left: (width/2)-100,
            child: Hero(
              tag : widget.heroTag,
              child: CachedNetworkImage(
              imageUrl: widget.pokemonDetail['img'],
              height: 200,
              fit: BoxFit.fitHeight,
              
              ),
            ),
            ),
        ],
        ),

    );
  }
}