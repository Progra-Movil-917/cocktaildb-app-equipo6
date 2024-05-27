import 'package:cocktaildb_app/domain/entities/drink.dart';
import 'package:cocktaildb_app/infrastructure/models/cocktaildb.dart';

class DrinkMapper {
  static Drink cocktailDBToEntity(CocktailDB cocktailDB) => Drink(
      drinkId: cocktailDB.idDrink,
      name: cocktailDB.strDrink,
      category: cocktailDB.strCategory,
      instructions: cocktailDB.strInstructions,
      glass: cocktailDB.strGlass,
      alcholic: cocktailDB.strAlcoholic,
      imageUrl: cocktailDB.strDrinkThumb);
}
