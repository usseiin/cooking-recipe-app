import 'package:cooking_recipe_app/models/model.dart';

extension FilterList on Stream<List<Food>> {
  Stream<List<Food>> filter(bool Function(Food) where) {
    return map((items) => items.where(where).toList());
  }
}

extension FilterListt on List<Food> {
  List<Food> filterr(bool Function(Food) fil) {
    return where(fil).toList();
  }
}
