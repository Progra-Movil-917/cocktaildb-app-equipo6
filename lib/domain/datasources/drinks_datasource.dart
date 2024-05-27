import 'package:cocktaildb_app/domain/entities/drink.dart';

abstract class DrinksDatasource {
  Future<List<Drink>> getDrinkById( String id );
  Future<List<Drink>> getDrinksByName( String name );
  Future<List<Drink>> getDrinksByFirstLetter( String letter );
}