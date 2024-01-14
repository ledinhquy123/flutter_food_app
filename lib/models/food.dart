class Food {
  String name;
  String imgFood;
  String nameChef;
  String imgChef;
  int favouriteNumber;
  String type;
  Duration duration;
  String description;
  List<String> ingredients = [];
  List<String> steps = [];

  Food({
    required this.name,
    required this.imgFood,
    required this.nameChef,
    required this.imgChef,
    required this.favouriteNumber,
    required this.type,
    required this.duration,
    required this.description,
    required this.ingredients,
    required this.steps
  });

}