import 'package:flutter/material.dart';
import 'package:cocktail_app/services/cocktail_api.dart';
import 'package:cocktail_app/models/cocktail_model.dart';

class CocktailDetailsScreen extends StatefulWidget {
  final int _cocktailId;

  CocktailDetailsScreen(this._cocktailId);

  @override
  _CocktailDetailsScreenState createState() => _CocktailDetailsScreenState();
}

class _CocktailDetailsScreenState extends State<CocktailDetailsScreen> {
  Cocktail _cocktail;

  @override
  void initState() {
    super.initState();
    _fetchCocktailDetails();
  }

  Future<void> _fetchCocktailDetails() async {
    final cocktail = await CocktailApi().fetchCocktailDetails(widget._cocktailId);
    setState(() {
      _cocktail = cocktail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_cocktail.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(_cocktail.image),
            Text(_cocktail.name),
            Text(_cocktail.category),
            Text(_cocktail.description),
          ],
        ),
      ),
    );