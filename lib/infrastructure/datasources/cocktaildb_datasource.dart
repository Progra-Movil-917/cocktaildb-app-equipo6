import 'package:cocktaildb_app/domain/datasources/drinks_datasource.dart';
import 'package:cocktaildb_app/domain/entities/drink.dart';
import 'package:cocktaildb_app/infrastructure/mappers/drink_mapper.dart';
import 'package:cocktaildb_app/infrastructure/models/cocktaildb_response.dart';
import 'package:dio/dio.dart';

class CocktailDBDatasource extends DrinksDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1',
  ));

  List<Drink> _jsonToDrinks(Map<String, dynamic> json) {
    final cocktaildDBResponse = CocktailDBResponse.fromJson(json);

    final List<Drink> drinks = cocktaildDBResponse.cocktails
        .map((drink) => DrinkMapper.cocktailDBToEntity(drink))
        .toList();

    return drinks;
  }

  @override
  Future<Drink> getDrinkById(int id) {
    // TODO: implement getDrinkById
    throw UnimplementedError();
  }

  @override
  Future<List<Drink>> getDrinksByFirstLetter(String letter) {
    // TODO: implement getDrinksByFirstLetter
    throw UnimplementedError();
  }

  @override
  Future<List<Drink>> getDrinksByName(String name) async {
    final response = await dio.get('/search.php?s=$name');
    return _jsonToDrinks(response.data);
  }
}
