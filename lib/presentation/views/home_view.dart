import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(CocktailsApp());
}

class CocktailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktails App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> cocktails = [];

  @override
  void initState() {
    super.initState();
    fetchRandomCocktails();
  }

  Future<void> fetchRandomCocktails() async {
    List<dynamic> fetchedCocktails = [];

    for (int i = 0; i < 13; i++) {
      final response = await http.get(
          Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));
      if (response.statusCode == 200) {
        fetchedCocktails.add(json.decode(response.body)['drinks'][0]);
      } else {
        throw Exception('Failed to load cocktails');
      }
    }

    setState(() {
      cocktails = fetchedCocktails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a Cocktails APP'),
      ),
      body: ListView.builder(
        itemCount: cocktails.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  cocktails[index]['strDrinkThumb'],
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cocktails[index]['strDrink'],
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        cocktails[index]['strCategory'],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      /*bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  fetchRandomCocktails();
                },
                child: Text('Home'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('List Drinks'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Search'),
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}
