import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List misPokemons = [];

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

    setState(() {

    });
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
      body: ListView.builder(
        itemCount: misPokemons.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Image.network(misPokemons[index]["img"]),
          );
        },
      )
    );
  }
}
