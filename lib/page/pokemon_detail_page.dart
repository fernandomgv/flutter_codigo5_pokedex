import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/model/pokemon_model.dart';

import '../ui/general/colors.dart';
import '../widgets/Item_Data_Pokemon_Widget.dart';
import '../widgets/item_type_widget.dart';

class PokemonDetailPage extends StatelessWidget {
  //const PokemonDetailPage({Key? key}) : super(key: key);
  PokemonModel pokemon;

  PokemonDetailPage(
      {required this.pokemon}
      );

  List<Widget> getmultipliers()
  {
    List<Widget> multipliers =[];
    multipliers.add(Text("Multipliers: ",
      style: TextStyle(
        color: Colors.black54,
      ),));
    pokemon.multipliers!.forEach((element) {
      multipliers.add(Container(
        margin: const EdgeInsets.symmetric(horizontal:4 ),
        child: Chip(
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            backgroundColor: Colors.white38,
            label: Text(element.toString())),
      )

      );
    });

    return multipliers;
  }

  List<Widget> getweaknesses()
  {
    List<Widget> weaknesses =[];
    weaknesses.add(Text("Weaknesses: ",
      style: TextStyle(
        color: Colors.black54,
      ),));
    pokemon.weaknesses!.forEach((element) {
      weaknesses.add(Container(
        margin: const EdgeInsets.symmetric(horizontal:4 ),
        child: Chip(
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            backgroundColor: Colors.white38,
            label: Text(element.toString())),
      )

      );
    });

    return weaknesses;
  }

  List<Widget> getnext_evolution()
  {
    List<Widget> next_evolution =[];
    next_evolution.add(Text("Next evolution: ",
      style: TextStyle(
        color: Colors.black54,
      ),));
    pokemon.nextEvolution!.forEach((element) {
      next_evolution.add(Container(
        margin: const EdgeInsets.symmetric(horizontal:4 ),
        child: Chip(
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            backgroundColor: Colors.white38,
            label: Text(element.name)),
      )

      );
    });

    return next_evolution;
  }

  @override
  Widget build(BuildContext context) {
    print(pokemon.type[0]);
    print(colorPokemon[pokemon.type[0]]);
    print(colorPokemon["Normal"]);
    print(colorPokemon["Water"]);

    return Scaffold(
      backgroundColor: colorPokemon[pokemon.type[0]],
      appBar: AppBar(
        backgroundColor: colorPokemon[pokemon.type[0]],
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pokemon.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0)),
                        const SizedBox(height: 5,),
                        Row(
                          children: pokemon.type
                              .map(
                                (e) => ItemTypeWidget(type: e)
                          ).toList(),
                        )
                      ],
                    ),
                    Text("# " + pokemon.num,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                        ))
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right:-30 ,
            top: MediaQuery.of(context).size.height*0.1,
              child: Image.asset("assets/images/pokeball.png",
              height: 200,
              color: Colors.white.withOpacity(0.27),
              )
          ),

          Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25,),
                            Center(
                              child: Text("About Pokemon",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            ),
                            ItemDataPokemonWidget(
                                label: "height",
                              value: pokemon.height,
                            ),
                            ItemDataPokemonWidget(
                              label: "weight",
                              value: pokemon.weight,
                            ),
                            ItemDataPokemonWidget(
                              label: "candy",
                              value: pokemon.candy,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: getmultipliers(),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: getweaknesses(),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: getnext_evolution(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: -150,
                        //left: MediaQuery.of(context).size.width*0.25,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.network(pokemon.img,
                            width: 200,
                            fit: BoxFit.cover,
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}


