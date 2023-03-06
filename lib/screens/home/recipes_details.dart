import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/models/model.dart';
import 'package:cooking_recipe_app/utils/responsive_size.dart';
import 'package:cooking_recipe_app/screens/home/components/components.dart';
import "package:flutter/material.dart";

import '../../utils/logic.dart';

class RecipesDetailScreen extends StatelessWidget {
  static const String route = "/recipe_detail_screen";
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

class Body extends StatefulWidget {
  const Body({Key? key, required this.recipe}) : super(key: key);
  final Food recipe;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "${foods.indexOf(widget.recipe)}",
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              widget.recipe.largeImage,
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
                  padding: EdgeInsets.only(left: getProportionalScreenWidth(0)),
                  child: Text(
                    "Ingredient",
                    style: detailText1style,
                  ),
                ),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: getProportionalScreenHeigth(10)),
                  children: List.generate(
                    widget.recipe.ingredient.length,
                    (index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: getProportionalScreenWidth(5),
                          ),
                          child: const Icon(
                            Icons.circle,
                            size: 15,
                            color: Colors.yellow,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.recipe.ingredient[index],
                            style: detailText2style,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                height(getProportionalScreenHeigth(8)),
                TableProp(recipe: widget.recipe),
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
                    itemCount: widget.recipe.preperationStep.length,
                    itemBuilder: (context, index) => Text(
                      widget.recipe.preperationStep[index],
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
