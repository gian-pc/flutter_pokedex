import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo3_pokedex/utils/colors.dart';
import 'package:flutter_codigo3_pokedex/widgets/item_type_widget.dart';

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
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokeDetail["name"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w800),
                        ),
                        Row(
                          children: pokeDetail["type"]
                              .map<Widget>(
                                (item) => ItemTypeWidget(
                                  type: item,
                                  type2: pokeDetail["type"][0],
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                    Text(
                      "#${pokeDetail["num"]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                child: Stack(
                  children: [
                    Align(
                      alignment:Alignment.center,
                      child: Image.asset(
                        'assets/images/pokeball.png',
                        fit: BoxFit.cover,
                        color: Colors.white.withOpacity(0.34),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        pokeDetail["img"],
                        fit: BoxFit.cover,
                        height: 140.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
