class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  String egg;
  List<double>? multipliers;
  List<String>? weaknesses;
  List<Map<String, String>>? nextEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.egg,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": List<dynamic>.from(type.map((x) => x)),
        "height": height,
        "weight": weight,
        "candy": candy,
        "egg": egg,
        "multipliers": List<dynamic>.from((multipliers ??[]).map((x) => x)),
        "weaknesses": List<dynamic>.from((weaknesses ??[]).map((x) => x)),
        "next_evolution": List<dynamic>.from((nextEvolution ??[]).map((x) => x)),
      };

  //Json Map -> Objeto de tipo Pokemon

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    num: json["num"],
    name: json["name"],
    img: json["img"],
    //type: json["type"] as List<String>,
    type: List<String>.from(json["type"].map((x)=>x)),
    height: json["height"],
    weight: json["weight"],
    candy: json["candy"],
    egg: json["egg"],
    multipliers: json["multipliers"]!=null? List<double>.from(json["multipliers"].map((e)=>e.toDouble())):[],
    weaknesses: json["weaknesses"]!=null? List<String>.from(json["weaknesses"].map((e)=>e)):[],
    nextEvolution: json["next_evolution"]!=null? List<Map<String,String>>.from(json["next_evolution"].map((e)=>e)):[],
  );
}
