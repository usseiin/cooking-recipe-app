import 'dart:async';

import 'package:cooking_recipe_app/utils/filter_list.dart';

import '../models/model.dart';

class RecipeService {
  final _foods = foods;

  late StreamController<List<Food>> _controller;

  RecipeService() {
    _controller = StreamController<List<Food>>.broadcast(
      onListen: () => _controller.sink.add(_foods),
    );
  }

  Future<List<Food>> getAllFood() async {
    final recipes = await Future.value(foods);
    return recipes;
  }

  Stream<List<Food>> get _filteredList =>
      _controller.stream.filter((p0) => p0.fav);

  Stream<List<Food>> get fetchFoods => _controller.stream;

  Stream<List<Food>> get favoriteRecipes => _filteredList;

  void toggleFavorite(String recipeName) {
    final recipePosition =
        _foods.indexWhere((recipe) => recipe.name == recipeName);
    var isFavorite = _foods[recipePosition].fav;
    _foods[recipePosition] = _foods[recipePosition].copyWith(fav: !isFavorite);
    _controller.sink.add(_foods);
  }
}
