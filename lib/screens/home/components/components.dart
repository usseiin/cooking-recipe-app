import 'package:cooking_recipe_app/constants/constants.dart';
import 'package:cooking_recipe_app/models/model.dart';
import 'package:cooking_recipe_app/utils/responsive_size.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(
    {required String text,
    IconData? icon,
    double? shadow,
    Color? shadowColor,
    Widget? iconlast,
    Widget? iconlast2,
    Function()? leadPress,
    Function()? actPress,
    Color? favColor}) {
  return AppBar(
    toolbarHeight: getProportionalScreenHeigth(80),
    primary: true,
    elevation: shadow ?? 0,
    shadowColor: shadowColor ?? Colors.transparent,
    backgroundColor: white,
    leading: Padding(
      padding: EdgeInsets.only(left: getProportionalScreenWidth(8)),
      child: IconButton(
        onPressed: leadPress,
        icon: Icon(
          icon,
          size: getProportionalScreenHeigth(40),
          color: black,
        ),
      ),
    ),
    title: Center(
      child: Text(
        text,
        style: titleTextStyle,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Padding(
          padding: EdgeInsets.only(right: getProportionalScreenHeigth(12)),
          child: iconlast,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Padding(
          padding: EdgeInsets.only(right: getProportionalScreenHeigth(12)),
          child: iconlast2,
        ),
      )
    ],
  );
}

class TableProp extends StatelessWidget {
  const TableProp({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Food recipe;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionalScreenHeigth(5),
                    right: getProportionalScreenWidth(5),
                  ),
                  child: const Icon(
                    Icons.circle,
                    size: 15,
                    color: black,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Prep Time: ${recipe.prepTime} min",
                    style: detailText2style,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionalScreenHeigth(5),
                    right: getProportionalScreenWidth(5),
                  ),
                  child: const Icon(
                    Icons.circle,
                    size: 15,
                    color: black,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Serving: ${recipe.servings}",
                    style: detailText2style,
                  ),
                )
              ],
            ),
          ],
        ),
        TableRow(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionalScreenHeigth(5),
                    right: getProportionalScreenWidth(5),
                  ),
                  child: const Icon(
                    Icons.circle,
                    size: 15,
                    color: black,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Calories: ${recipe.calories}",
                    style: detailText2style,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionalScreenHeigth(5),
                    right: getProportionalScreenWidth(5),
                  ),
                  child: const Icon(
                    Icons.circle,
                    size: 15,
                    color: black,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Cook Time: ${recipe.cookTime} min",
                    style: detailText2style,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
