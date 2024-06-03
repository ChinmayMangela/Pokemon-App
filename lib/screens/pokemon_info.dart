import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/pokemon.dart';
import 'package:myapp/provider/favorite_pokemon_provider.dart';
import 'package:provider/provider.dart';

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('#00${pokemon.id}'),
      actions: [
        Consumer<FavoritePokemonProvider>(
          builder: (context, favoritePokemonProvider, child) => IconButton(
            onPressed: () {
              favoritePokemonProvider.addFavoritePokemon(pokemon);
            },
            icon: Icon(
              Icons.favorite,
              color: favoritePokemonProvider.favoritePokemons.contains(pokemon)
                  ? Colors.red
                  : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 130,
            backgroundImage: NetworkImage(pokemon.imageUrl),
          ),
          const SizedBox(
            height: 20,
          ),
          _displayPokemonInfo(),
        ],
      ),
    );
  }

  Widget _buildText(
      String value, double fontSize, bool boldFont, Color fontColor) {
    return Text(
      value,
      style: GoogleFonts.lato(
        fontSize: fontSize,
        fontWeight: boldFont
            ? FontWeight.bold
            : boldFont
                ? FontWeight.bold
                : FontWeight.normal,
        color: fontColor,
      ),
    );
  }

  Widget _displayPokemonInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(70, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText(pokemon.name, 30, true, Colors.black),
          _buildText('${pokemon.type} Type', 15, false, Colors.black45),
          _displayPokemonEvolutions(),
          _displayPokemonAbilities(),
        ],
      ),
    );
  }

  Widget _displayPokemonEvolutions() {
    String evolutionTag = pokemon.evolutions.length > 1 ? 'Evolutions' : 'Evolution';
    int numberOfEvolutions = pokemon.evolutions.length;
    String evolutions = numberOfEvolutions > 0 ? pokemon.evolutions.map((evolution) => evolution).toString() : 'None';
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: _buildText(
        '$evolutionTag: $evolutions',
        15,
        false,
        Colors.black,
      ),
    );
  }

  Widget _displayPokemonAbilities() {
    String abilityTag = pokemon.abilities.length > 1 ? 'Abilities' : 'Ability';
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: _buildText(
        '$abilityTag: ${pokemon.abilities.map((ability) => ability).toList()}',
        15,
        false,
        Colors.black,
      ),
    );
  }
}
