
import 'package:flutter/material.dart';

class PokemonDetailPage extends StatelessWidget {


  Map pokeDetail;

  PokemonDetailPage({required this.pokeDetail});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Example"),
          ),
          body: Center(
            child: Text(pokeDetail["name"]),
          ),
        );
  }
}
