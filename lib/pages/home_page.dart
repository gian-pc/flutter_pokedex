import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List misPokemons = [];

  Map<String, Color> mapColor={
    "Grass": Color(0xff48D0B0),
    "Fire": Color(0xffFB6C6C),
    "Water": Color(0xff76BDFE),
    "Electric": Color(0xffFFD86F),
    "Poison": Color(0xff634078),
    "Psychic": Color(0xff634078),
    "Bug": Color(0xff48D0B0),
    "Rock": Color(0xff696969),
    "Ground": Color(0xffB8860B),
    "Normal": Color(0xff28C1D2),
    "Ghost": Color(0xff39335C),
    "Ice": Color(0xff76BDFE),
    "Dragon": Color(0xffFB6C6C),
    "Fighting": Color(0xff28C1D2),
  };


  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    print("Obteniendo data....");
    String path =
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
    Uri _uri = Uri.parse(path);
    http.Response res = await http.get(_uri);

    //print("STATUSSSSSS CODE: ${res.statusCode}");

    Map<String, dynamic> myMap = json.decode(res.body);
    misPokemons = myMap["pokemon"];

    setState(() {});
    // misPokemons.forEach((element) {
    //   print("Pokemon: ${element["img"]}");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Pokedex",
          style: TextStyle(
            color: Color(0xff4b4b4b),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_open,
              color: Color(0xff4b4b4b),
              size: 30.0,
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: misPokemons
            .map(
              (poke) => Card(
                elevation: 3.0,
                shadowColor: Colors.white54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26.0),
                ),
                color: mapColor[poke["type"][0]],
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -30,
                      right: -26,
                      child: Container(
                        height: 120,
                        width: 120,
                        child: Image.asset(
                          'assets/images/pokeball.png',
                          color: Colors.white.withOpacity(0.35),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            poke["name"],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: poke["type"]
                                  .map<Widget>(
                                    (type) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 4.0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 7.0, vertical: 4.0),
                                      decoration: BoxDecoration(
                                        color: mapColor[poke["type"][0]],
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12
                                                .withOpacity(0.15),
                                            blurRadius: 12.0,
                                            offset: Offset(2, 5),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        type,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                  .toList())
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.network(
                        poke["img"],
                        width: 140,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exc,
                            StackTrace? stack) {
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
