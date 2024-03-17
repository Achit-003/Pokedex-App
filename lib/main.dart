import 'package:flutter/material.dart';
import 'package:pokedex_app/home_screen.dart';

void main(){
  runApp(Pokedex());
}

class Pokedex  extends StatelessWidget {
  const Pokedex ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}