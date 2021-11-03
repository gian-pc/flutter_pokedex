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


  Map<String,dynamic> toJson()=>{
    "id":id,
    "num": num,
    "name": name,
    "img":img,
    "type":type,
    "height":height,
    "weight":weight,
    "candy":candy,
    "egg":egg,
    "multipliers":multipliers,
    "weaknesses":weaknesses,
    "next_evolution":nextEvolution,
  };

  //Json Map -> Objeto de tipo Pokemon

}
