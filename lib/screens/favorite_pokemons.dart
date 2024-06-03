import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/model/pokemon.dart';
import 'package:myapp/provider/favorite_pokemon_provider.dart';
import 'package:myapp/screens/pokemon_info.dart';
import 'package:provider/provider.dart';

class FavoritePokemonsScreen extends StatelessWidget {
  const FavoritePokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<FavoritePokemonProvider>(
      builder: (context, favoritePokemonProvider, child) => ListView.builder(
        itemCount: favoritePokemonProvider.favoritePokemons.length,
        itemBuilder: (context, index) {
          final favoritePokemon =
              favoritePokemonProvider.favoritePokemons[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PokemonInfo(pokemon: favoritePokemon);
                },
              ),
            ),
            child: _favoriteItemContainer(favoritePokemon),
          );
        },
      ),
    );
  }

  Widget _favoriteItemContainer(Pokemon pokemon) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context
                  .read<FavoritePokemonProvider>()
                  .removeFavoritePokemon(pokemon);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(pokemon.imageUrl),
        ),
        title: Text(pokemon.name),
      ),
    );
  }
}
