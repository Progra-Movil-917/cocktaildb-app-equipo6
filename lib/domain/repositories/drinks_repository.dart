import 'package:cocktaildb_app/domain/entities/drink.dart';

abstract class DrinksRepository {
  Future<Drink> getDrinkById( int id );
  Future<List<Drink>> getDrinksByName( String name );
  Future<List<Drink>> getDrinksByFirstLetter( String letter );
}