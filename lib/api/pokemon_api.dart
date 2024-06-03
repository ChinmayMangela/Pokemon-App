import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/model/pokemon.dart';

class PokemonApi {
  static Future<List<Pokemon>> fetchPokemon() async {
    const url = 'https://dummyapi.online/api/pokemon';
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      List<Pokemon> pokemons = [];
      for(Map<String, dynamic> i in body) {
        pokemons.add(Pokemon.fromJson(i));
      } 
      return pokemons;
    } else {
      throw Exception('Failded to load Pokemons');
    }
  }
}