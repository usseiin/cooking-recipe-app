class Food {
  Food({
    required this.name,
    required this.smallImage,
    required this.largeImage,
    required this.description,
    required this.calories,
    required this.servings,
    required this.prepTime,
    required this.cookTime,
    required this.ingredient,
    required this.preperationStep,
    required this.toServe,
  });

  final String name, smallImage, largeImage, description;
  final int calories, servings, prepTime, cookTime;
  final List<String> ingredient, preperationStep, toServe;
  bool fav = false;

  void toggleFav() {
    fav = !fav;
  }
}

class User {
  User(
    this.fullname,
    this.username,
    this.password,
    this.bodyWeight,
    this.height,
  );

  final String fullname, username, password;
  final int recipesLearnt = 0, bodyWeight, height;
}
