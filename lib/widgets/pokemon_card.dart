

import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/model/pokemon_model.dart';
import 'package:flutter_codigo5_pokedex/page/pokemon_detail_page.dart';

import '../ui/general/colors.dart';

class PokemonCard extends StatelessWidget {
 // const PokemonCard({Key? key}) : super(key: key);
  /*
  String num;
  String name;
  String img;
  List<String> type;
*/
  PokemonModel pokemon;
  PokemonCard({
    /*
    required this.num,
    required this.name,
    required this.img,
    required this.type
     */
required this.pokemon
});

  List<Widget> renderTypes(){

    List<Widget> types =[];
   // print(this.type);
    pokemon.type.forEach((element) {
      types.add(
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.3),
            ),
            child: Text(element.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0
                )
            ),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            margin: EdgeInsets.only(bottom: 8),
          )
      );
    });

    return types;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonDetailPage(pokemon: pokemon,)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: colorPokemon[pokemon.type[0]],
          /*
          color: this.type.contains("Water") ? Color(0xff58ABF6)
                 :  (this.type.contains("Fire") || this.type.contains("Flying") ) ? Color(0xffF7786B) : Color(0xff45C9A8)
          */

        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(pokemon.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ) ),
                  Text(pokemon.num,
                      style: TextStyle(
                          color: Colors.black12,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                      ) )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: renderTypes()
                  /*
                  [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Text("Poison",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0
                          )
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    ),
                    const SizedBox(height: 8,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Text("Grass",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0
                          )
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    ),
                  ]  */
                  ,
                ),
              ),
            ),
            Positioned(
              bottom: -24 ,
              right: -25,
              child: Image.asset('assets/images/pokeball.png',
                height: 115,
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Positioned(
                bottom: -5,
                right: -10,
                child: Image.network(pokemon.img,
                  height: 115,
                ))
          ],
        ),
      ),
    );
  }
}
