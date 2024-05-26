import 'package:json_annotation/json_annotation.dart';

part 'cocktail_model.g.dart';

@JsonSerializable()
class Cocktail {
  @JsonKey(name: 'idDrink')
  int id;

  @JsonKey(name: 'strDrink')
  String name;

  @JsonKey(name: 'strDrinkThumb')
  String image;

  @JsonKey(name: 'strCategory')
  String category;

  Cocktail({this.id, this.name, this.image, this.category});

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);
}8