import 'package:flutter/material.dart';
import 'package:cocktail_app/services/cocktail_api.dart';
import 'package:cocktail_app/models/cocktail_model.dart';

class CocktailListScreen extends StatefulWidget {
  @override
  _CocktailListScreenState createState() => _CocktailListScreenState();
}

class _CocktailListScreenState extends State<CocktailListScreen> {
  List<Cocktail> _cocktails = [];

  @override
  void initState() {
    super.initState();
    _fetchCocktails();
  }

  Future<void> _fetchCocktails() async {
    final cocktails = await CocktailApi().fetchCocktails();
    setState(() {
      _cocktails = cocktails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de bebidas'),
      ),
      body: ListView.builder(
        itemCount: _cocktails.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(_cocktails[index].image),
            title: Text(_cocktails[index].name),
            subtitle: Text(_cocktails[index].category),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CocktailDetailsScreen(_cocktails[index].id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}