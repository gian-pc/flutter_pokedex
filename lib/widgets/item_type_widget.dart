import 'package:flutter/material.dart';
import 'package:flutter_codigo3_pokedex/utils/colors.dart';

class ItemTypeWidget extends StatelessWidget {

  String type;
  String type2;

  ItemTypeWidget({required this.type, required this.type2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: EdgeInsets.symmetric(
          horizontal: 7.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: mapColor[type2],
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
    );
  }
}