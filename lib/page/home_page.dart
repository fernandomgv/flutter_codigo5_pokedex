

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/pokemon_model.dart';
import '../widgets/pokemon_card.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemonList=[];
  List<PokemonModel> pokemonModelList = [];

  getDataPokemon() async{
   Uri _uri = Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json");
   //Uri _uri = Uri.parse("http://apitest.gestionparticipativa.pe.iica.int/rest/content/site/GestionParticipativa3/es-ES/document/Procesos/Papa-familia-clima/Inicio/Objetivo?format=json");
   //Uri _uri = Uri.parse("http://apitest.gestionparticipativa.pe.iica.int/rest/content/site/GestionParticipativa3/es-ES/all/Procesos/Papa-familia-clima/inicio?classnames=GP.Slider&format=json&where=Titulo='Meta 1'");
    //Uri _uri = Uri.parse("http://apitest.gestionparticipativa.pe.iica.int/rest/content/site/GestionParticipativa3/es-ES/all/EDX/modulos?classnames=GP.CursoModulo&format=json");


    Map<String,String> headers = {'Authorization':'Basic YWRtaW5pc3RyYXRvcjpNZjk5Nzk5NSQ='};

    http.Response response = await http.get(_uri,headers: headers);
    print(response.statusCode);
    print(json.decode(response.body));
    Map<String, dynamic> myMap = json.decode(response.body);
    //print(myMap["cms_documents"][0]["GP_Slider"][0]["Resumen"]);
   pokemonList = myMap["pokemon"];

   myMap["pokemon"].forEach((pokemon){
     print("name: " +pokemon["name"]);
   }
   );

   pokemonModelList = pokemonList.map((e) => PokemonModel.fromJson(e)).toList();
   setState(() {});

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataPokemon();
  }
  
  List<Widget> getCards() {
    List<Widget> cards = [];
    //pokemonList.forEach((element)
    pokemonModelList.forEach((element)
    {
    // print(element["type"].toString());
      /*
      List<String> types = [];
      element["type"].forEach((type)
      {
      types.add(type.toString());
      }
      );
      */
      cards.add(PokemonCard(
        /*
          num: element["num"],
          name:  element["name"],
          img: element["img"],
        type: types,
        */
        pokemon: element,
      )
      );
    });
    
    return cards;
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
         title: Text("PokedexApp"),
          backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(onPressed: (){},icon:Icon(Icons.search_outlined) ,),
          IconButton(onPressed: (){},icon:Icon(Icons.filter_alt_outlined) ,),
          IconButton(onPressed: (){},icon:Icon(Icons.arrow_upward_outlined) ,),
       ]
      ),

      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
            children: [
              Text("Pokedex",
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold
              ),),
            GridView.count(
              physics: const ScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.3,
            shrinkWrap: true,
            children: getCards(),
            )
            /*
              RefreshIndicator(
                strokeWidth: 2,
                //color: kBrandPrimaryColor,
                onRefresh: () async {
                  //getData();
                },
                child: ListView.builder(
                  //physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pokemonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:  NetworkImage(pokemonList[index]["img"]),
                      ),
                      title:  Text(pokemonList[index]["name"]),

                    );
                  },
                ),
              )
            */
            ],
            ),
          ),
        ),
      ),
    );
  }
}
