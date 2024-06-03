import 'package:flutter/material.dart';
import 'package:myapp/provider/favorite_pokemon_provider.dart';
import 'package:myapp/screens/bottom_navbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritePokemonProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavbarScreen()
    );
  }
}

