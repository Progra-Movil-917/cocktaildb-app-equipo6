class CocktailDB {
  final String idDrink;
  final String strDrink;
  final String strAlcoholic;
  final String strGlass;
  final String strInstructions;
  final String strCategory;
  final String strDrinkThumb;

  CocktailDB(
      {required this.idDrink,
      required this.strDrink,
      required this.strAlcoholic,
      required this.strGlass,
      required this.strInstructions,
      required this.strCategory,
      required this.strDrinkThumb});

  factory CocktailDB.fromJson(Map<String, String> json) => CocktailDB(
      idDrink: json["idDrink"] ?? '',
      strDrink: json["strDrink"] ?? '',
      strAlcoholic: json["strAlcoholic"] ?? '',
      strGlass: json["strGlass"] ?? '',
      strInstructions: json["strInstructions"] ?? '',
      strCategory: json["strCategory"] ?? '',
      strDrinkThumb: json["strDrinkThumb"] ?? '');
    
    Map<String, String> toJson() => {
      "idDrink": idDrink,
      "strDrink": strDrink,
      "strAlcoholic": strAlcoholic,
      "strGlass": strGlass,
      "strInstructions": strInstructions,
      "strCategory": strCategory,
      "strDrinkThumb": strDrinkThumb
    };
}
