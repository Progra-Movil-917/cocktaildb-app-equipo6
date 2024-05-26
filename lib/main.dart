import 'package:flutter/material.dart';
import 'package:cocktail_app/models/cocktail_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
class CocktailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Bebidas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrinkList(),
    );
  }
}

class DrinkList extends StatefulWidget {
  @override
  _DrinkListState createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bebidas Aleatorias'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchRandomDrink(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var drink = snapshot.data['drinks'][0];
            return ListView(
              children: [
                ListTile(
                  leading: Image.network(drink['strDrinkThumb']),
                  title: Text(drink['strDrink']),
                ),
                // Aquí puedes agregar más detalles de la bebida
              ],
            );
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _fetchRandomDrink() async {
    return await _apiService.fetchRandomDrink();
  }
}