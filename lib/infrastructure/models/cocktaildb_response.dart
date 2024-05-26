class CocktailsResponse {
    final List<Map<String, String?>> drinks;

    CocktailsResponse({
        required this.drinks,
    });

    factory CocktailsResponse.fromJson(Map<String, dynamic> json) => CocktailsResponse(
        drinks: List<Map<String, String?>>.from(json["drinks"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
