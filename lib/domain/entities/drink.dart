class Drink {
  final int drinkId;
  final String name;
  final String category;
  final String imageUrl;
  final String instructions;
  final String glass;
  final bool isAlcoholic;

  Drink(
      {required this.drinkId,
      required this.name,
      required this.category,
      required this.instructions,
      required this.glass,
      required this.isAlcoholic,
      required this.imageUrl});
}
