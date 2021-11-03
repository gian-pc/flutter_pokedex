import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo3_pokedex/models/pokemon_model.dart';
import 'package:flutter_codigo3_pokedex/utils/colors.dart';
import 'package:flutter_codigo3_pokedex/widgets/item_type_widget.dart';

class PokemonDetailPage extends StatelessWidget {
  Pokemon pokeDetail;

  PokemonDetailPage({required this.pokeDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mapColor[pokeDetail.type[0]],
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
      body: Column(
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
                      pokeDetail.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800),
                    ),
                    Row(
                      children: pokeDetail.type
                          .map<Widget>(
                            (item) => ItemTypeWidget(
                              type: item,
                              type2: pokeDetail.type[0],
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
                Text(
                  "#${pokeDetail.num}",
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
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/pokeball.png',
                    fit: BoxFit.cover,
                    color: Colors.white.withOpacity(0.34),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    pokeDetail.img,
                    fit: BoxFit.cover,
                    height: 140.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(14.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      color: Colors.black87.withOpacity(0.7),
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 60.0),
                      child: Divider(
                        thickness: 0.6,
                      ),
                    ),
                  ),
                  ItemInfoWidget(data: pokeDetail.height, title: "Height"),
                  ItemInfoWidget(data: pokeDetail.weight, title: "Weight"),
                  ItemInfoWidget(data: pokeDetail.candy, title: "Candy"),
                  ItemInfoWidget(data: pokeDetail.egg, title: "Egg"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Multipliers: ",
                          style: TextStyle(
                              color: Colors.black87.withOpacity(0.5),
                              fontSize: 17.0),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: pokeDetail.multipliers != null
                                  ? pokeDetail.multipliers!
                                      .map<Widget>(
                                        (item) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          child: Chip(
                                            backgroundColor: Colors.white,
                                            elevation: 2,
                                            label: Text(
                                              item.toString(),
                                            ),
                                            avatar: CircleAvatar(
                                              backgroundColor: Colors.blueAccent
                                                  .withOpacity(0.8),
                                              child: Text(
                                                'M',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()
                                  : [
                                      Text(
                                        "None",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Weaknesses: ",
                          style: TextStyle(
                              color: Colors.black87.withOpacity(0.5),
                              fontSize: 17.0),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: pokeDetail.weaknesses != null
                                  ? pokeDetail.weaknesses!
                                      .map<Widget>(
                                        (item) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          child: Chip(
                                            backgroundColor: Colors.white,
                                            elevation: 2,
                                            label: Text(
                                              item.toString(),
                                            ),
                                            avatar: CircleAvatar(
                                              backgroundColor: Colors.redAccent
                                                  .withOpacity(0.8),
                                              child: Text(
                                                'W',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()
                                  : [
                                      Text(
                                        "None",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Next Evolution: ",
                          style: TextStyle(
                              color: Colors.black87.withOpacity(0.5),
                              fontSize: 17.0),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: pokeDetail.nextEvolution != null
                                  ? pokeDetail.nextEvolution!
                                      .map<Widget>(
                                        (item) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          child: Chip(
                                            backgroundColor: Colors.white,
                                            elevation: 2,
                                            label: Text(
                                              item["name"].toString(),
                                            ),
                                            avatar: CircleAvatar(
                                              backgroundColor: Colors.purpleAccent
                                                  .withOpacity(0.8),
                                              child: Text(
                                                'N',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()
                                  : [
                                      Text(
                                        "None",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemInfoWidget extends StatelessWidget {
  final String data;
  final String title;

  ItemInfoWidget({required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              color: Colors.black87.withOpacity(0.5),
              fontSize: 17.0,
            ),
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87.withOpacity(0.7),
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
