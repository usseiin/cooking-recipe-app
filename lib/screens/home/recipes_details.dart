import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/models/model.dart';
import 'package:cooking_recipe_app/models/responsive_size.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import "package:flutter/material.dart";

class RecipesDetailScreen extends StatelessWidget {
  final Food recipe;
  const RecipesDetailScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        leadPress: () => Navigator.of(context).pop(),
        text: recipe.name,
        shadow: 0,
        icon: Icons.chevron_left,
        iconlast: const Icon(Icons.favorite),
        favColor:
            (recipe.fav) ? Colors.red : const Color.fromARGB(192, 0, 0, 0),
      ),
      body: Body(recipe: recipe),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key, required this.recipe}) : super(key: key);
  final Food recipe;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "${listOfProd.indexOf(recipe)}",
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              recipe.largeImage,
              height: getProportionalScreenHeigth(251),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionalScreenWidth(42),
            right: getProportionalScreenWidth(27),
            top: getProportionalScreenHeigth(11),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: getProportionalScreenWidth(5)),
                  child: Text(
                    "Ingredient",
                    style: detailText1style,
                  ),
                ),
                Table(
                  children: recipe
                      .returnListTableRow(), //createTable(listOfProd.ingredient, Colors.yellow),
                ),
                height(getProportionalScreenHeigth(8)),
                TableProp(recipe: recipe),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionalScreenHeigth(8)),
                  child: Text(
                    "Preparation",
                    style: detailText1style,
                  ),
                ),
                SizedBox(
                  height: getProportionalScreenHeigth(186),
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: recipe.preperationStep.length,
                    itemBuilder: (context, index) => Text(
                      recipe.preperationStep[index],
                      style: detailText2style,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
