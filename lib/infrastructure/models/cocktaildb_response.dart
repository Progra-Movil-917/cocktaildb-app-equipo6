import 'package:cocktaildb_app/infrastructure/models/cocktaildb.dart';

class CocktailDBResponse {
  final List<CocktailDB> cocktails;

  CocktailDBResponse({
    required this.cocktails,
  });

  factory CocktailDBResponse.fromJson(Map<String, dynamic> json) =>
      CocktailDBResponse(
          cocktails: List<CocktailDB>.from(
              json["drinks"]?.map((e) => CocktailDB.fromJson(e)) ?? []));

  Map<String, dynamic> toJson() =>
      {"drinks": List<dynamic>.from(cocktails.map((x) => x.toJson()))};
}
