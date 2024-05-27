import 'package:cocktaildb_app/domain/entities/drink.dart';
import 'package:cocktaildb_app/domain/repositories/drinks_repository.dart';
import 'package:cocktaildb_app/infrastructure/datasources/cocktaildb_datasource.dart';

class CocktailRepositoryImpl extends DrinksRepository {

  final CocktailDBDatasource datasource;
  CocktailRepositoryImpl(this.datasource);

  @override
  Future<List<Drink>> getDrinkById(String id) {
    return datasource.getDrinkById(id);
  }

  @override
  Future<List<Drink>> getDrinksByFirstLetter(String letter) {
    return datasource.getDrinksByFirstLetter(letter);
  }

  @override
  Future<List<Drink>> getDrinksByName(String name) {
    return datasource.getDrinksByName(name);
  }
  
  @override
  Future<List<Drink>> getRandomDrinks() {
    return datasource.getRandomDrinks();
  }

}