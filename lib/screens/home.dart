import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/api/pokemon_api.dart';
import 'package:myapp/model/pokemon.dart';
import 'package:myapp/screens/pokemon_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
      future: PokemonApi.fetchPokemon(),
      builder: (context, snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapShot.hasError) {
              return Text('Error: ${snapShot.error}');
            } else {
              return _generatePokemonList(snapShot.data!);
            }
        }
      },
    );
  }

  Widget _generatePokemonList(List<Pokemon> pokemons) {
    return GridView.builder(
      itemCount: pokemons.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];
        return _pokemonTile(pokemon);
      },
    );
  }

  Widget _pokemonTile(Pokemon pokemon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PokemonInfo(pokemon: pokemon);
            },
          ),
        );
      },
      child: Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(pokemon.imageUrl),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                pokemon.name,
                style: GoogleFonts.lato(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
