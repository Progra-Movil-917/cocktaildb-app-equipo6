import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Cocktails App"),
      ),
      bottomNavigationBar: BottomNavigationBar(
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