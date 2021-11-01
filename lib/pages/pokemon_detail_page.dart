import 'package:flutter/material.dart';
import 'package:flutter_codigo3_pokedex/utils/colors.dart';

class PokemonDetailPage extends StatelessWidget {
  Map pokeDetail;

  PokemonDetailPage({required this.pokeDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mapColor[pokeDetail["type"][0]],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Center(
        child: Text(pokeDetail["name"]),
      ),
    );
  }
}
