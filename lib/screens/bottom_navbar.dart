import 'package:flutter/material.dart';
import 'package:myapp/screens/favorite_pokemons.dart';
import 'package:myapp/screens/home.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  var _currentPageIndex = 0;
  Widget _activePage = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    if (_currentPageIndex == 1) {
      setState(() {
        _activePage = const FavoritePokemonsScreen();
      });
    } else {
      setState(
        () {
          _activePage = const HomeScreen();
        },
      );
    }

    return Scaffold(
        appBar: _buildAppBar(),
        body: _activePage,
        bottomNavigationBar: _buildBottomNavbar());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Pokemons'),
    );
  }

  BottomNavigationBar _buildBottomNavbar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
      ],
      currentIndex: _currentPageIndex,
      onTap: (index) {
        setState(
          () {
            _currentPageIndex = index;
          },
        );
      },
    );
  }
}
