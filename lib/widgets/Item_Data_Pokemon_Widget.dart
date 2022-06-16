
import 'package:flutter/material.dart';

class ItemDataPokemonWidget extends StatelessWidget {

  String label;
  String value;
  ItemDataPokemonWidget({
    required this.label,
    required this.value
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0,),
      child: Row(
        children: [
          Text(this.label+" : ",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Text(this.value),
        ],
      ),
    );
  }
}