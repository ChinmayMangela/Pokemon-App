
import 'package:flutter/material.dart';
import 'package:myapp/model/pokemon.dart';

class FavoritePokemonProvider extends ChangeNotifier {
  List<Pokemon> favoritePokemons = [];

  void addFavoritePokemon(Pokemon pokemon) {
    if(!favoritePokemons.contains(pokemon)) {
      favoritePokemons.add(pokemon);
    }
    notifyListeners();
  }

  void removeFavoritePokemon(Pokemon pokemon) {
    favoritePokemons.remove(pokemon);
    notifyListeners();
  }
}