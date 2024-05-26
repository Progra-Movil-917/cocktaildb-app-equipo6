import 'package:cocktaildb_app/presentation/views/drink_list_view.dart';
import 'package:cocktaildb_app/presentation/views/home_view.dart';
import 'package:cocktaildb_app/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final views = [const HomeView(), const DrinkListView(), const SearchView()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Cocktails App"),
      ),
      body: views[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: 'Lista de bebidas',
            icon: Icon(Icons.view_list)
          ),
          BottomNavigationBarItem(
            label: 'Buscar',
            icon: Icon(Icons.search_rounded)
          ),
        ]
      ),
    );
  }
}