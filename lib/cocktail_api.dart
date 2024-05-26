import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:cocktail_app/models/cocktail_model.dart';

class CocktailApi {
  static const String _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';

  Future<List<Cocktail>> fetchCocktails() async {
    final response = await http.get('$_baseUrl/filter.php?a=Alcoholic');

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final cocktails = (jsonData['drinks'] as List)
          .map((json) => Cocktail.fromJson(json))
          .toList();
      return cocktails;
    } else {
      throw Exception('Failed to load cocktails');
    }
  }

  Future<Cocktail> fetchCocktailDetails(int id) async {
    final response = await http.get('$_baseUrl/lookup.php?i=$id');

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final cocktail = Cocktail.fromJson(jsonData['drinks'][0]);
      return cocktail;
    } else {
      throw Exception('Failed to load cocktail details');
    }
  }
}