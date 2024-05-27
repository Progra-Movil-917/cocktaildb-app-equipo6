import 'package:cocktaildb_app/domain/entities/drink.dart';
import 'package:cocktaildb_app/domain/repositories/drinks_repository.dart';
import 'package:cocktaildb_app/infrastructure/datasources/cocktaildb_datasource.dart';

class CocktailRepositoryImpl extends DrinksRepository {

  final CocktailDBDatasource datasource;
  CocktailRepositoryImpl(this.datasource);

  @override
  Future<Drink> getDrinkById(int id) {
    // TODO: implement getDrinkById
    throw UnimplementedError();
  }

  @override
  Future<List<Drink>> getDrinksByFirstLetter(String letter) {
    return datasource.getDrinksByFirstLetter(letter);
  }

  @override
  Future<List<Drink>> getDrinksByName(String name) {
    return datasource.getDrinksByName(name);
  }

}